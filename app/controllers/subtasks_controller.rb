class SubtasksController < ApplicationController
    before_action :set_task
    before_action :set_subtask, only: [:edit, :update, :destroy]

    def new
        @subtask = @task.subtasks.new
    end


    def create
        @subtask = @task.subtasks.new(subtask_params)
        if @subtask.save
            redirect_to task_path(@task)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit #step 3
    end
    
    def update
        if @subtask.update(subtask_params)
            redirect_to task_path(@task)
        else
            render :edit, status:unprocessable_entity 
        end
    end

    def destroy
        if @subtask.destroy
            redirect_to task_path(@task)
        end
    end


    private
    
    def subtask_params
        params.require(:subtask).permit(:user_story, :story_points, :status, :task_id)
    end
    
    def set_task #step 2
        @task = Task.find(params[:task_id])
    end
    
    def set_subtask
        @subtask = @task.subtasks.find(params[:id])
    end
end
