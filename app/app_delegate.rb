class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = WelcomeController.alloc.init
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end
end

class Pintador

  attr_accessor :controller

  def initialize(controller)
    @controller = controller
    dibuja_las_teclas
  end

  def keys
    Key.total_number_of_keys
  end

  def dibuja_las_teclas
    keys.times do |n|
      k = Key.new
      key = k.button
      puts key.inspect
      key.frame = CGRectMake(0,y(n),k.width, k.height)
      key.backgroundColor = UIColor.random_color[n]
      key.addTarget(@controller, action:"play_sound_#{n}", forControlEvents:UIControlEventTouchDown)
      @controller.view.addSubview(key)
    end
  end

  def y(n)
    n * Key.height
  end

end

class UIColor

  def self.random_color
    [
      UIColor.rgba(243, 156, 18,1.0),
      UIColor.rgba(230, 126, 34,1.0),
      UIColor.rgba(231, 76, 60,1.0),
      UIColor.rgba(142, 68, 173,1.0),
      UIColor.rgba(52, 73, 94,1.0),
      UIColor.rgba(243, 156, 18,1.0),
      UIColor.rgba(230, 126, 34,1.0),
      UIColor.rgba(231, 76, 60,1.0),
      UIColor.rgba(142, 68, 173,1.0),
      UIColor.rgba(52, 73, 94,1.0)
    ]
  end

  def self.rgba(r,g,b,a)
    UIColor.colorWithRed( r/255.0, green: g/255.0, blue: b/255.0, alpha:a)
  end

end

class Key

  attr_accessor :total_number_of_keys, :window

  def initialize
    @button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @button.frame = CGRectMake(10,10,width,height)
  end

  def button
    @button
  end

  def window
    @window ||= Window.new
  end

  def self.total_number_of_keys
    7
  end

  def self.height
    Window.new.height / Key.total_number_of_keys
  end

  def height
    window.height / Key.total_number_of_keys
  end

  def width
    window.width
  end

end

class WelcomeController < UIViewController

  def viewDidLoad
    Pintador.new(self)
  end

  def play_sound_0
    SystemSounds.play_system_sound("3A.aif")
  end

  def play_sound_1
    SystemSounds.play_system_sound("3B.aif")
  end

  def play_sound_2
    SystemSounds.play_system_sound("3C.aif")
  end

  def play_sound_3
    SystemSounds.play_system_sound("3D.aif")
  end

  def play_sound_4
    SystemSounds.play_system_sound("3E.aif")
  end

  def play_sound_5
    SystemSounds.play_system_sound("3F.aif")
  end

  def play_sound_6
    SystemSounds.play_system_sound("3G.aif")
  end

end
