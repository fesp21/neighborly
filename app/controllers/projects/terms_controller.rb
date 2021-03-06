class Projects::TermsController < ApplicationController
  inherit_resources
  defaults resource_class: ProjectDocument, collection_name: :project_documents
  load_and_authorize_resource class: :ProjectDocument

  actions :create, :destroy
  belongs_to :project, finder: :find_by_permalink!

  def index
    @project = parent
    @documents = parent.project_documents
  end

  def create
    create! { project_terms_path(parent) }
  end

  def destroy
    destroy! { project_terms_path(parent) }
  end
end
