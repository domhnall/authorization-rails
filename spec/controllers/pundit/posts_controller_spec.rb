require 'rails_helper'
require 'support/shared_contexts/authorized_posts_controller_context'
require 'support/shared_examples/authorized_posts_controller'

describe Pundit::PostsController, type: :controller do
  include_context "authorized posts controller context"

  it_behaves_like "an authorized posts controller", Pundit::NotAuthorizedError
end
