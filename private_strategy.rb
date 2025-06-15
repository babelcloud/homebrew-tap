class GitHubPrivateRepositoryReleaseDownloadStrategy < CurlDownloadStrategy
  require "utils/formatter"
  require "utils/github"

  def initialize(url, name, version, **meta)
    super
    parse_url_pattern
  end

  def parse_url_pattern
    url_pattern = %r{https://github.com/([^/]+)/([^/]+)/releases/download/([^/]+)/(\S+)}
    unless @url =~ url_pattern
      raise CurlDownloadStrategyError, "Invalid url pattern for GitHub Release."
    end

    _, @owner, @repo, @tag, @filename = *@url.match(url_pattern)
  end

  def download_url
    assets = GitHub.get_release(@owner, @repo, @tag).fetch("assets")
    assets.find{|a| a["name"] == @filename }.fetch("url")
  end

  private

  def _fetch(url:, resolved_url:, timeout:)
    curl_download download_url,
      "--header", "Accept: application/octet-stream",
      "--header", "Authorization: bearer #{GitHub::API.credentials}",
      to: temporary_path
  end

end