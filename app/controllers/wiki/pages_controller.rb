module Wiki
  class PagesController < ApplicationController
    def show
      @page = current_tenant.wiki_pages.find params[:id]
    end

    def new
      @page = current_tenant.wiki_pages.new new_wiki_page_params
    end

    def create
      @page = current_tenant.wiki_pages.new wiki_page_params

      if @page.save
        redirect_to wiki_page_path(@page)
      else
        render :new
      end
    end

    def edit
      @page = current_tenant.wiki_pages.find(params[:id])
    end

    def update
      @page = current_tenant.wiki_pages.find(params[:id])

      if @page.update wiki_page_params
        redirect_to wiki_page_path(@page)
      else
        render :edit
      end
    end

    def destroy
      @page = current_tenant.wiki_pages.find(params[:id])
      @page.destroy
      redirect_to wiki_folder_path(@folder)
    end

    private

    def new_wiki_page_params
      params.permit(:folder_id)
    end

    def wiki_page_params
      params.require(:wiki_page).permit(:title, :content, :folder_id)
    end

    def sidebar
      :wiki
    end
  end
end
