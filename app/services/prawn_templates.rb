module PrawnTemplates
  def add_header(pdf, title)
    # Set font and font size
    pdf.font "Helvetica", size: 12

# Add the header with logo, address, and contact
pdf.bounding_box([0, pdf.bounds.top - 5], width: pdf.bounds.width) do
  pdf.image("#{Rails.root}/app/assets/images/logo.png", width: 100, position: :center)
  pdf.move_down(10)
  pdf.text "1CISP Bldg., #11 Mapagbigay cor. Maunlad Sts., Brgy. Pinyahan, Diliman, Quezon City", align: :center, size: 9
  pdf.text "Contact: (02) 8 556 2700", align: :center, size: 9
end

  end

  def add_footer(pdf, footer_text)
   # Footer
   pdf.text "Generated on: #{Time.now}", size: 8, align: :right
  end
end
