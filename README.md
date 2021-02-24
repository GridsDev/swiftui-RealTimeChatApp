# swiftui-RealTimeChatApp
https://iosacademy.teachable.com/courses/871451/lectures/20218529

### ขั้นตอนที่ 1 จัดเตรียมสภาพแวดล้อมให้พร้อมใช้งาน

ในบทแนะนำนี้เราจะจัดตั้งโครงการของเราและวางรากฐาน พร้อมด้วยสภาพแวดล้อมที่จำเป็น เป็นสิ่งสำคัญที่จะต้องเริ่มต้นด้วยฐานที่แข็งแกร่งเพื่อ ทบทวน และ เพิ่มคุณสมบัติ ในขณะที่เราดำเนินการ

1. เปิด terminal เข้าไปยัง Finder โปรเจ็กจากนั้น

        gridsjivapong@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git init
        
        gridsjivapong@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git add .
        
        gridsjivapong@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git status
        
        gridsjivapong@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git commit -m "Getting Started"
        
        gridsjivapong@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git log
        
        gridsjivapong@Gridss-MacBook-Pro swiftui-RealTimeChatApp % pod init
        
        gridsjivapong@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git add .
        
        gridsjivapong@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git status
        
2. ที่โปรเจ็กเพิ่ม 
- New Group > Resources
- New Group > ViewModels
- New Group > Models
- New Group > Views > Storyboards
- New Group > Controllers

3. ย้าย 
- AppDelegate.swift และ SceneDelegate.swift ไปไว้ใน Resources
- ViewController.swift ไปไว้ใน Controllers
- Assets.xcassets ไปไว้ใน Views
- Main.storyboard, LaunchScreen.storyboard ไปไว้ใน Views > Storyboards

4. Rename ViewController.swift เป็น ConversationsViewController.swift จากนั้น Coding @ ConversationsViewController.swift แก้ class เป็น class ConversationsViewController

5. @ Main.storyboard > View Controller Scene ที่แทป Inspectors ด้านขวา แก้ไข Class ให้เป็น ConversationsViewController

6. @ swiftui-RealTimeChatApp ที่ Device Orientation เอาเครื่องหมายถูกออกที่
- Landscape Left
- Landscape Right

7. @ Info.plist ที่ Supported interface orientations (iPad) ลบ Item 2 และ Item3

8. @ Controllers เพิ่ม 4 New File > Cocoa Touch Class กำหนดค่าดังนี้
- File LoginViewController
- - Class : LoginViewController
- - Subclass of : UIViewController
- - Language : Swift
- File RegisterViewController
- - Class : RegisterViewController
- - Subclass of : UIViewController
- - Language : Swift
- File PhotoViewerViewController
- - Class : PhotoViewerViewController
- - Subclass of : UIViewController
- - Language : Swift
- File VideoPlayerViewController
- - Class : VideoPlayerViewController
- - Subclass of : UIViewController
- - Language : Swift

9. กลับไปที่ terminal พิมพ์คำสั่ง

        gridsjivapong@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git status
        
        gridsjivapong@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git add .
 
        gridsjivapong@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git status
        
        gridsjivapong@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git commit -m "Wrap up getting started"
        
- ปิด terminal แล้วเปิดขึ้นมาใหม่

        gridsjivapong@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git status


### ขั้นตอนที่ 2 Login & Registration

ในส่วนนี้เราจะสร้างหน้าจอเข้าสู่ระบบและการลงทะเบียน นอกจากนี้เราจะเริ่มเชื่อมโยงเวิร์กโฟลว์ Firebase ที่จำเป็นสำหรับบัญชีที่ใช้อีเมล/รหัสผ่าน
