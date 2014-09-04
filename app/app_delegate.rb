class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    note_controller = NoteController.alloc.init

    nav_controller = UINavigationController.alloc.initWithRootViewController(note_controller)

    @window.rootViewController = nav_controller

    true
  end
end
