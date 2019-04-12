class NotesController < ApplicationController
    before_action :find_note, only: [:update]

    def index
      @notes = Note.where(notebook_id: note_params[:notebook_id])
      render json: @notes
    end

    def show
        @note = Note.find(params[:id])
        render json: @note
    end

    def user_notes
      @notes = Note.where(user_id: note_params[:user_id])
      render json: @notes
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
        @note.destroy
    end 
   
    private
   
    def note_params
      params.permit(:user_id,:notebook_id, :title, :content)
    end
   
    def find_note
      @note = Note.find(params[:id])
    end
end
