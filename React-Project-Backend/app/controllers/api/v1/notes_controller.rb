class Api::V1::NotesController < ApplicationController
    before_action :find_note, only: [:update]

    def index
      @notes = Note.where(notebook_id: note_params[:notebook_id])
      render json: @notes
    end

    def show
        @note = Note.find(params[:id])
    end 

    def create
        @note = Note.new(note_params)
        if @note.save
            render json: @note, status: :accepted
        else 
            render json: { errors: @note.errors.full_messages }, status: :unprocessible_entity
        end 
    end 
   
    def update
      @note.update(note_params)
      if @note.save
        render json: @note, status: :accepted
      else
        render json: { errors: @note.errors.full_messages }, status: :unprocessible_entity
      end
    end

    def destroy
        @note = Note.find(params[:id])
        @note.destory 
    end 
   
    private
   
    def note_params
      params.permit(:notebook_id, :title, :content)
    end
   
    def find_note
      @note = Note.find(params[:id])
    end
end
