class Employee < Prawn::Document
  def initialize(user, emp_detail, jb_description, taskperformance, oth_performed, req_training, view)
    super()
    @user = user
    @emp_detail = emp_detail
    @jb_description = jb_description
    @taskperformance = taskperformance
    @oth_performed = oth_performed
    @req_training = req_training
    @view = view
    generate_pdf
  end


  def generate_pdf
    text "User Profile Report", size: 20, style: :bold, align: :center
    move_down 20

    add_card("Employee Details") do
    table_:default = [
      ["Fullname:", @emp_detail.Fullname&.upcase],
      ["Position Title:", @emp_detail.pos_title&.upcase],
    ]
    table(table_data, cell_style: { padding: 5 })
    end

    render


  end

  def add_card(title, &block)
    bounding_box([0, cursor], width: 540, height: 350) do
      stroke_bounds
      move_down 10
      text title, style: :bold, size: 16
      move_down 10
      yield
    end
    move_down 20
  end
end
