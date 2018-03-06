# 30 Swift Projects in 30 Days




## 01. Change Font
### Change font by pressing button.
Use `CocoaPods` to manage frameworks, `SnapKit` for autolaying.




## 02. Timer
### A simple timer tool
Use `CocoaPods`, `SnapKit`, `Timer`.




## 03. Pull To Refresh
### Pull the tableview to refresh data
Use `UITableView`, `UIRefreshControl`, `Date`, `DateFormatter`




## 04. Emoji Slot Machine
### A slot machine game using UIPickerView
Use `UIPickerView` to make the view, `UILongPressGestureRecognizer` to make a gesture to cheat.




## 05. Photo Viewer
### A photo viewer using gesture to resizing.
Use `UIScrollView` to resize picture and display part of it.




## 06. Color Gradient
### Change UIView color gradient.
Use `UIPanGestureRecognizer`, `CAGradientLayer`.




## 07. Swipe Row
### Swipe on UITableViewRow, actions will display on the right.
Use `UITableViewRowAction`, `UIAlertController`.




## 08. Stretchy Header
### Pull UITableVIew down, the header picture will resize.
Use `UIScrollView` - `scrollViewDidScrol` to get offset to resize picture.




## 09. Video Background
### Spotify-like video background on UIViewController
Use `AVPlayerViewController`.




## 10. Tumblr Menu
### Tumber-like menu. Use tap gesture to display a motion effect menu.
Use `UIVisualEffectView`, `animate()`.




## 11. 3D Touch
### Quick action with 3D touch press on home screen and peek view in app.
Use `UIApplicationShortcutItem`, `UIViewControllerPreviewingDelegate`.



## 12. Spotlight Search

### Search items in Spotlight.
Use *CSSearchableItem* to create an item supports Spotlight. Use *CSSearchableItemAttributeSet* to configurate it.
Implement
`func application(_ application: UIApplication, continue userActivity: NSUserActivity`
in AppDelegate.swift to process after selecting a result in Spotlight.




## 13. Today Extension
### Add today extension to Today View.
Use `App Group` to share data between App and Extension. Use `NSUserDefault` to save and load data.




## 14. Core Data
### Use Core Data to save and load data.
Use `CoreData` kit. Define entity first. Use `appDelegate.persistentContainer.viewContext` to save and read data.




## 15. Photo Read & Save
### Read photo from library and save photo to library.
Use `UIImagePickerControllerDelegate` to select photo from library. Use `UIImageWriteToSavedPhotosAlbum()` to save photo.



## 16. QR Code
### Generate QR code.
Use `Core Image`, `CIFilter` to generate QR code.



## 17. Face Detect

### Detect face in photo.

Use `Core Image`, `CIDetector`to detect face.



## 18. Popover Menu

### A Wechat-like popover menu.

Use `UIPopoverPresentationControllerDelegate`,  `PopoverMenuViewController`.



## 19. Vertical Menu Transition

### Customize naviation transition to present a vertical menu.

Use `UIViewControllerAnimatedTransitioning`, `UIViewControllerTransitioningDelegate`.



## 20. Custom Transition

### Customize transition to present view.

Use `UICollectionViewDelegate` . Use `UIViewControllerAnimatedTransitioning` to customize transition.



## 21. Circle Progress View
### A circle progress view.

Use `CAShapeLayer` to create dircle progress view class.



## 22. Twitter Splash View

### A twitter-like splash view.

Use `CAAnimationDelegate`, `CABasicAnimation`, `CAmediaTimingFunction`.


## 23. Floating Menu

### A menu with floating item.

Use `CGAffineTransform`, `UIVIew.animate()`.
