class ContentformPdf < Prawn::Document
	def initialize(content_form)
		super(top_margin: 70)
		@content_form = content_form
		text "#{@content_form.content}"
	end
end