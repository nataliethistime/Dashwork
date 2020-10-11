module Wiki
  class FoldersController < ApplicationController
    def index
      @folders = current_tenant.wiki_folders.root_level
      @pages = current_tenant.wiki_pages.root_level
    end

    def show
      @folder = current_tenant.wiki_folders.find(params[:id])
      @folders = @folder.folders
      @pages = @folder.pages
    end

    def new
      @folder = current_tenant.wiki_folders.new(new_wiki_folder_params)
    end

    def create
      @folder = current_tenant.wiki_folders.new(wiki_folder_params)

      if @folder.save
        redirect_to wiki_folder_path(@folder)
      else
        render :new
      end
    end

    def edit
      @folder = current_tenant.wiki_folders.find(params[:id])
    end

    def update
      @folder = current_tenant.wiki_folders.find(params[:id])

      if @folder.update(wiki_folder_params)
        redirect_to wiki_folder_path(@folder)
      else
        render :edit
      end
    end

    def destroy
      @folder = current_tenant.wiki_folders.find(params[:id])
      @folder.destroy
      redirect_to @folder.parent.present? ? wiki_folder_path(@folder.parent) : wiki_folders_path
    end

    private

    def sidebar
      :wiki
    end

    def new_wiki_folder_params
      params.permit(:parent_id)
    end

    def wiki_folder_params
      params.require(:wiki_folder).permit(:name, :parent_id)
    end
  end
end
