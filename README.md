# swiftui-RealTimeChatApp
โปรดทราบว่าผมใช้ MacBook Pro 2020 ระบบปฏิบัติการ macOS Big Sur 11.2.1 และ Xcode 12.4 
https://iosacademy.teachable.com/courses/871451/lectures/20218529

> ในบทนี้เราจะสร้างโครงการของเราโดยใช้ interface Stroryboard 

### ขั้นตอนที่ 1 จัดเตรียมสภาพแวดล้อมให้พร้อมใช้งาน

ในบทแนะนำนี้เราจะจัดตั้งโครงการของเราและวางรากฐาน พร้อมด้วยสภาพแวดล้อมที่จำเป็น เป็นสิ่งสำคัญที่จะต้องเริ่มต้นด้วยฐานที่แข็งแกร่งเพื่อ ทบทวน และ เพิ่มคุณสมบัติ ในขณะที่เราดำเนินการ

1. เปิด terminal เข้าไปยัง Finder โปรเจ็กจากนั้น

        ai@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git init
        
        ai@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git add .
        
        ai@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git status
        
        ai@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git commit -m "Getting Started"
        
        ai@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git log
        
        ai@Gridss-MacBook-Pro swiftui-RealTimeChatApp % pod init
        
        ai@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git add .
        
        ai@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git status
        
2. ที่โปรเจ็กเพิ่ม 
- New Group > Resources
- New Group > ViewModels
- New Group > Models
- New Group > Views > Storyboards
- New Group > Controllers > Login

3. ย้าย 
- AppDelegate.swift และ SceneDelegate.swift ไปไว้ใน Resources และเพิ่ม Swift File ชื่อ Extensions.swift และ DatabaseManager.swift
- ViewController.swift ไปไว้ใน Controllers
- Assets.xcassets ไปไว้ใน Views
- Main.storyboard, LaunchScreen.storyboard ไปไว้ใน Views > Storyboards

4. Rename ViewController.swift เป็น ConversationsViewController.swift จากนั้น Coding @ ConversationsViewController.swift แก้ class เป็น class ConversationsViewController

5. @ Main.storyboard > View Controller Scene ที่แทป Inspectors ด้านขวา แก้ไข Class ให้เป็น ConversationsViewController

6. @ swiftui-RealTimeChatApp ที่ Device Orientation เอาเครื่องหมายถูกออกที่
- Landscape Left
- Landscape Right

7. @ Info.plist ที่ Supported interface orientations (iPad) ลบ Item 2 และ Item3

8. @ Info.plist คลิ๊กที่ปุ่ม + เพิ่ม Privacy - Camera Usage Description เพื่อขอใช้งานกล้อง และ Privacy - Photo Library Additions Usage Description
- Privacy - Camera Usage Description เพื่อขอสิทธิ์ใช้งานกล้อง
  - Key : Privacy - Camera Usage Description
  - Type : String
  - Value : Please allow access to take a profile picture
- Privacy - Photo Library Additions Usage Description เพื่อขอสิทธิ์ใช้งานโฟล์เดอร์รูปภาพของอุปกรณ์
  - Key : Privacy - Photo Library Additions Usage Description
  - Type : String
  - Value : Please allow access to select a photo for your profile.


9. @ Controllers เพิ่ม 4 New File > Cocoa Touch Class กำหนดค่าดังนี้

- File PhotoViewerViewController
  - Class : PhotoViewerViewController
  - Subclass of : UIViewController
  - Language : Swift
- File VideoPlayerViewController
  - Class : VideoPlayerViewController
  - Subclass of : UIViewController
  - Language : Swift
  
  และ 2 File นี้ใน Controllers > Login
  
  - File LoginViewController
    - Class : LoginViewController
    - Subclass of : UIViewController
    - Language : Swift
  - File RegisterViewController
    - Class : RegisterViewController
    - Subclass of : UIViewController
    - Language : Swift

10. @ Assets.xcassets เพิ่ม Image set ชื่อ logo

11. กลับไปที่ terminal พิมพ์คำสั่ง

        ai@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git status
        
        ai@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git add .
 
        ai@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git status
        
        ai@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git commit -m "Wrap up getting started"
        
- ปิด terminal แล้วเปิดขึ้นมาใหม่

       ai@Gridss-MacBook-Pro swiftui-RealTimeChatApp % git status


### ขั้นตอนที่ 2 Login & Registration Coding

ในส่วนนี้เราจะสร้างหน้าจอเข้าสู่ระบบและการลงทะเบียน นอกจากนี้เราจะเริ่มเชื่อมโยงเวิร์กโฟลว์ Firebase ที่จำเป็นสำหรับบัญชีที่ใช้อีเมล/รหัสผ่าน

1. Link ไปที่ไฟล์ตัวอย่าง

2. Taking & Choosing Photo

### ขั้นตอนที่ 3 Firebase Set Up & Email/Password Log In

1. เปิด Terminal ใช้คำสั่ง cd เข้าไปยังไฟลเดอร์ Project
- $ open Podfile

เพิ่มรายการที่ต้องการ install

     pod 'Firebase/Core'
     pod 'Firebase/Auth'
     pod 'Firebase/Database'

- Save File
- $ pod install
- $ open [Project Name].xcworkspace 

        open swiftui-RealTimeChatApp.xcworkspace/
     
2. Copy Bundle Identifier แล้วไปที่เว็บ firebase.google.com

- Create Project ใน Console Firebase (รหัสชุด iOS : คือ Bundle Identifier ที่ Copy ไว้จากข้อที่แล้ว) [ลงทะเบียนแอป]
- Download GoogleService-Info.plist แล้วลากไปไว้ใน Application Project ของเรา
- คลิ๊ก [ถักไป] จนถึง [เสร็จสิ้น]

3. @AppDelegate.swift 

        import Firebase

- เพิ่ม FirebaseApp.configure() ที่ไฟล์ AppDelegate.swift ตามตัวอย่าง

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                        
            FirebaseApp.configure()
            
            return true
        }
             
4. ไปที่หน้าเว็บ Firebase อีกครั้ง 
- @เมนูฝั่งซ้ายเลือก Authentication > คลิ๊ก [เริ่มใช้งาน]
- @tab Sign-in method เปิดใช้งาน Email/Password 

5. @RegisterViewController.swift เพิ่ม

        import Firebase
        
และเพิ่ม

        // Firebase Login
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { authResult, error in
            guard let result = authResult, error == nil else {
                print("Error cureatinguser")
                return
            }
            let user = result.user
            print("Created User: \(user)")
        })

6. @LoginViewController.swift 

        import Firebase

และ 

        // Firebase Log in
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: {authResult, error in
            guard let result = authResult, error == nil else {
                print("Failed to log in user with email: \(email)")
                return
            }
            let user = result.user
            print("Logged In User: \(user)")
        })
        
ถึงตรงนี้ แอป ควรจะสามารถ SignIUp และ SignIn ได้อย่างไม่ติดปัญหาใดๆ

Check Point ณ จุดนี้ถ้าไม่ error ก็ไปต่อข้อถัดไปกันเลย

### ขั้นตอนที่ 4 Database Set Up

> กรณีที่ยังไม่เคยติดตั้ง SF Symbols ให้ไปที่เว็บไซต์ developer.apple.com/design/ ศึกษาข้อมูลก่อน Download หลังจากนั้นทำการ Download และติดตั้ง

** ถ้า ติดการแสดงผลอยู่ที่หน้า BG ให้ไปที่เมนู Device ใน Xcode แล้วเลือก Erase All content and setting ** 

** ตรวจสอบให้แน่ใจว่าได้พิมพ์คำสั่ง validateAuth() แล้ว

1. ไปที่เว็บ firebase.google.com > Cloud Firestore คลิ๊กที่ [สร้างฐานข้อมูล] เลือก เริ่มต้นในโหมดทดสอบ คลิ๊ก [ถัดไป] ตำแหน่ง Cloud Firestore อันนี้ผมเลือกเป็น asia-southeast2 สามารถเลือกตามโซนที่ต้องการใช้งานได้เลย จากนั้น คลิ๊ก [เปิดใช้] 

2. ที่เว็บ firebase.google.com > เลือกเมนู Realtime Database คลิ๊กที่ [สร้างฐานข้อมูล] ตำแหน่งของ Realtime Database ผมเลือกเป็น สหรัฐอเมริกา (us-central1) จากนั้น คลิ๊ก [ถัดไป] เลือก เริ่มต้นในโหมดทดสอบ คลิ๊ก [เปิดใช้] เมื่อโปรแกรมทำงานเสร็จสิ้น ให้คลิ๊กที่เมนู [กฎ] แก้ไขกฎ จากนั้น คลิ๊กที่ [เผยแพร่]

        {
            "rules": {
                ".read": true,
                ".write": true
            }
        }

3. @DatabaseManager.swift 
- import FirebaseDatabase
- เพิ่ม Code นี้
        
        final class DatabaseManager {
            
            static let shared = DatabaseManager()
            
            private let database = Database.database().reference()
            
            public func test() {
            
                database.child("foo").setValue(["something": true])
                
            }
            
        }

3. @ConversationsViewController ใน class ConversationsViewController ใต้ func viewDidLoad() เพิ่ม Code ด้านล่างนี้

        DatabaseManager.shared.test()
        
4. @RegisterViewController



5. ไปที่เว็บ firebase.google.com > Authentication ลบ User เดิมออกก่อน สาเหตุเพราะเมื่อสร้าง user account แล้ว จะเพิ่ม database ไปพร้อมกันเพื่อเก็บข้อมูลต่างๆของ user แต่เนื่องจากก่อนหน้านี้เราได้มีการทดสอบเพิ่ม user account ไปแล้วแต่ ณ เวลานั้นเรายังไม่ได้เพิ่ม Code ในการเพิ่มตาราง database จึงต้องลบ user account ที่ใช้ในการทดสอบก่อนหน้านี้ออกก่อน

6. เปิด terminal แล้วพิมพ์คำสั่งตามนี้

        $ git status

        $ git add

        $ git status

        $ git commit -m "Handle auth session, add database"

### ขั้นตอนที่ 5 Facebook Log In ในขั้นตอนนี้เราจะได้เรียนรูกเกี่ยวกับการใช้งาน StoryBoard

1. @Main.storyboard

2. เลือก Tab Bar Controller แล้วเปิดเมนูด้านขวา ในส่วนของ View Controller ติ๊กที่หน้า Is Initial View Controller
- เปลี่ยนชื่อ Item Scene ทั้ง 2 Scene ตามลำดับ จาก Item เป็น Chats และ Item เป็น Profile
- @Scene Conversations View Controller เปลี่ยนชื่อแทป Title เป็น Chats และเมนูด้านขวา ใน TabMenu เลือก Show The Identity inspator ในส่วนของ Class เปลี่ยนเป็น ConversationsViewController
- @Scene View Controller  เปลี่ยนชื่อแทป Title เป็น Profile และเมนูด้านขวา ใน TabMenu เลือก Show The Identity inspator ในส่วนของ Class เปลี่ยนเป็น ProfileViewController
- @Scene Chats คลิ๊กที่ Title ใน Scene Chats จากนั้นที่เมนูด้านขวา ใน TabMenu เลือก Show The Attributes inspator ที่ navigation Bar ติ๊กที่หน้า Perfers Large Titles ทำแบบเดียวกันกับ Scene Profile

3. ไปที่เว็บ https://developers.facebook.com/ สมัครสมาชิคและ create app เลือก สร้างการใช้งานแบบเชื่อมต่อระหว่างแอพ 
- เมื่อสร้างแอพเสร็จสิ้น ให้เลือก {การเข้าสู่ระบบ Facebook} > [การตั้งค่า] 
- เลือก iOS จากนั้นที่ Dropdown Menu เลือก SDK: Cocoapods มองหาคำว่า "เพิ่มรายการต่อไปนี้ลงใน Podfile ของคุณ: pod 'FBSDKLoginKit'"
- เปิด terminal ไปที่โฟลเดอร์โปรเจ็ก เปิดไฟล์ pod มาแก้ไขโดยเพิ่ม pod 'FBSDKLoginKit' จากนั้นทำการ install Podfile
- กลับไปที่ developers.facebook.com แล้ว คลิ๊ก [Next] หรือ [ถัดไป]
- ใส่ Bundle ID และ คลิ๊ก [Save] หรือ [บันทึก] biz.microtronic.app.swiftui-RealTimeChatApp

