module Wiki
  class PagesController < ApplicationController
    before_action :set_folder

    def show
      @page = @folder.pages.find params[:id]
    end

    def new
      @page = @folder.pages.new
    end

    def create
      @page = @folder.pages.new wiki_page_params

      if @page.save
        redirect_to wiki_folder_page_path(@folder, @page)
      else
        render :new
      end
    end

    def edit
      @page = @folder.pages.find(params[:id])
    end

    def update
      @page = @folder.pages.find(params[:id])

      if @page.update wiki_page_params
        redirect_to wiki_folder_page_path(@folder, @page)
      else
        render :edit
      end
    end

    def destroy
      @page = @folder.pages.find(params[:id])
      @page.destroy
      redirect_to wiki_folder_path(@folder)
    end

    private

    def set_folder
      @folder = current_tenant.wiki_folders.find(params[:folder_id])
    end

    def wiki_page_params
      params.require(:wiki_page).permit(:title, :content)
    end

    def sidebar
      :wiki
    end
  end
end
