require File.expand_path('../rails_helper', __dir__)

RSpec.describe 'POST /redmine_github/webhook/' do
  it {
    expect(RedmineGithub::PullRequestHandler).to receive(:handle)
    post redmine_github_webhook_path(format: :json), headers: { 'x-github-event' => 'pull_request' }
    expect(response).to have_http_status(:ok)
  }
end