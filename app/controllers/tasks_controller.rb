class TasksController < ApplicationController

    before_action :set_task, only: [:show, :edit, :update, :destroy] #step 1
    def index
        @tasks = Task.all
        @test = "THIS IS A TEST"
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to task_path(@task)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
    end

    def edit #step 3
    end

    def update
        if @task.update(task_params)
         redirect_to task_path(@task)
        else
         render :edit, status:unprocessable_entity 
        end

        #task.update(task_params) ? redirect_to task_path(@task) :render :edit
    end

    def destroy
        if @task.destroy
            redirect_to task_path(@task), notice: 'Task has been deleted successfully.'
        end
    end

    private

    def task_params
        params.require(:task).permit(:title, :description)
    end
    
    def set_task #step 2
     @task = Task.find(params[:id])
    end

end