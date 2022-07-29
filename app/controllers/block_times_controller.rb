# frozen_string_literal: true

class BlockTimesController < ApplicationController
  before_action :set_block_time, only: %i[show edit update destroy]

  # GET /block_times or /block_times.json
  def index
    @block_times = BlockTime.all
  end

  # GET /block_times/1 or /block_times/1.json
  def show; end

  # GET /block_times/new
  def new
    @block_time = BlockTime.new
  end

  # GET /block_times/1/edit
  def edit; end

  # POST /block_times or /block_times.json
  def create
    @block_time = BlockTime.new(block_time_params)

    respond_to do |format|
      if @block_time.save
        format.html do
          redirect_to block_time_url(@block_time), notice: 'Block time was successfully created.'
        end
        format.json { render :show, status: :created, location: @block_time }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @block_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /block_times/1 or /block_times/1.json
  def update
    respond_to do |format|
      if @block_time.update(block_time_params)
        format.html do
          redirect_to block_time_url(@block_time), notice: 'Block time was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @block_time }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @block_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /block_times/1 or /block_times/1.json
  def destroy
    @block_time.destroy

    respond_to do |format|
      format.html { redirect_to block_times_url, notice: 'Block time was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_block_time
    @block_time = BlockTime.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def block_time_params
    params.require(:block_time).permit(:start, :end)
  end
end
