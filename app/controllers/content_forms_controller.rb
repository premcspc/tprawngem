class ContentFormsController < ApplicationController
  # GET /content_forms
  # GET /content_forms.json
  def index
    @content_forms = ContentForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @content_forms }
    end
  end

  # GET /content_forms/1
  # GET /content_forms/1.json
  def show
    @content_form = ContentForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.pdf do 
        pdf = ContentformPdf.new(@content_form)
        send_data(pdf.render, filename: "#{@content_form.title}.pdf",
                              type: "application/pdf",
                              disposition: "inline")
      end
      format.json { render json: @content_form }
    end
  end

  # GET /content_forms/new
  # GET /content_forms/new.json
  def new
    @content_form = ContentForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content_form }
    end
  end

  # GET /content_forms/1/edit
  def edit
    @content_form = ContentForm.find(params[:id])
  end

  # POST /content_forms
  # POST /content_forms.json
  def create
    @content_form = ContentForm.new(params[:content_form])

    respond_to do |format|
      if @content_form.save
        format.html { redirect_to @content_form, notice: 'Content form was successfully created.' }
        format.json { render json: @content_form, status: :created, location: @content_form }
      else
        format.html { render action: "new" }
        format.json { render json: @content_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /content_forms/1
  # PUT /content_forms/1.json
  def update
    @content_form = ContentForm.find(params[:id])

    respond_to do |format|
      if @content_form.update_attributes(params[:content_form])
        format.html { redirect_to @content_form, notice: 'Content form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @content_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content_forms/1
  # DELETE /content_forms/1.json
  def destroy
    @content_form = ContentForm.find(params[:id])
    @content_form.destroy

    respond_to do |format|
      format.html { redirect_to content_forms_url }
      format.json { head :no_content }
    end
  end
end
