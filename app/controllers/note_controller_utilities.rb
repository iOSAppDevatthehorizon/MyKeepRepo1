def get_label(xPosition,yPosition,label_text)
  label = UILabel.alloc.initWithFrame(CGRectMake(xPosition, yPosition, 100, 30))
  label.backgroundColor = UIColor.clearColor
  label.font = UIFont.fontWithName("HelveticaNeue-CondensedBold", size:18)
  label.text = label_text
  label
end
def get_justified_title_label(yPosition,label_text,parent)
  label = UILabel.alloc.initWithFrame(CGRectZero)
  label.text = label_text
  label.sizeToFit
  label.center = CGPointMake(parent.view.frame.size.width / 2, yPosition)
  label
end
def get_text_field(xPosition,yPosition)
  input_field = UITextField.alloc.initWithFrame(CGRectMake(xPosition, yPosition, 280,30))
  input_field.textColor = UIColor.blackColor
  input_field.backgroundColor = UIColor.whiteColor
  input_field.setBorderStyle UITextBorderStyleRoundedRect
  input_field
end
def get_text_view(xPosition,yPosition)
  input_field = UITextView.alloc.initWithFrame(CGRectMake(xPosition, yPosition, 280,150))
  input_field.textColor = UIColor.blackColor
  input_field.backgroundColor = UIColor.whiteColor
  input_field
end
def get_button(xPosition,yPosition,button_text)
  button = UIButton.buttonWithType UIButtonTypeSystem
  button.setTitle button_text, forState: UIControlStateNormal
  button.frame = [[xPosition, yPosition], [100, 40]]
  button
end