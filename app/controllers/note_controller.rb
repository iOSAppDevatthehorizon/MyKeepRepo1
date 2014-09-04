class NoteController < UIViewController
  attr_accessor :all_notes

  def all_notes=(all_notes)
    @all_notes= all_notes
  end

  def viewDidLoad
    super
    @all_notes ||= []

    self.view.backgroundColor = UIColor.whiteColor  
    self.title = "My Keep"
    all_notes_button = UIBarButtonItem.alloc.initWithTitle("All Notes", style:UIBarButtonSystemItemAdd, target:self, action:'display_notes')
    self.navigationItem.rightBarButtonItem = all_notes_button
    add_note_form = create_form
    self.view.addSubview(add_note_form)
  end

  def touchesBegan(touches, withEvent:event)
    self.view.endEditing(true)
  end

  def create_form
    add_note_form = UIView.alloc.initWithFrame([[10,70],[300,400]])
    
    form_label = get_justified_title_label(10,"Add a note !",self)
    
    title_label = get_label(10,30,"Title")
    @title_input = get_text_field(10,65)

    content_label = get_label(10,100,"Content")
    @content_input = get_text_field(10,135)

    add_button = get_button(10,170,"ADD")
    add_button.addTarget(self,
    action: :submit_note,
    forControlEvents: UIControlEventTouchUpInside)

    add_note_form.addSubview(form_label)
    add_note_form.addSubview(title_label)
    add_note_form.addSubview(@title_input)
    add_note_form.addSubview(content_label)
    add_note_form.addSubview(@content_input)
    add_note_form.addSubview(add_button)

    add_note_form    
  end

  def submit_note
    @all_notes << { "title" => @title_input.text, "content" => @content_input.text }
    @alert_box = UIAlertView.alloc.initWithTitle("Values",
        message:"Title: #{@title_input.text} \n Content: #{@content_input.text} \n #{self.all_notes.count}",
        delegate: nil,
        cancelButtonTitle: "OK",
        otherButtonTitles:nil)
    @alert_box.show
  end

  def display_notes
    new_controller = ListController.alloc.init
    new_controller.all_notes = @all_notes
    self.navigationController.pushViewController(new_controller, animated:true)
  end  
end