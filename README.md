# BulletProofBox -- 分享一个锁屏小技巧

代码功能及解决的问题
-------------------------------------------------
该锁屏处理技巧运用在 数据安全性要求更高 的iOS应用程序中，是由客户提出的
# 真实需求！

对于高数据安全要求的应用程序，客户通常会要求应用程序有如下逻辑：
            ①  从 活动状态  ---进入-->  挂起状态后 进行锁屏处理(如：进入后台/从Task列表切换其他程序) 。
            ②  在①的操作之后，重新从 挂起状态  ---返回-->  活动状态后 验证用户身份（如：PinCode验证）。
            
很多应用只是实现了进入 挂起状态后的锁屏，然而当应用程序进入Task列表之际（双击Home键操作），在Task列表中该应用程序依然显示为活动状态！

如何全方位的锁住我们的应用程序，同时更加智能的控制 锁屏/解锁？
除了①和②，让我们看看这个技巧还能【额外】做些什么:
            ③  从 活动状态  ---进入-->  Task列表后  显示锁屏
            ④  从③的操作直接返回 原应用程序时（即未切换到其他程序），【自动】解除锁屏

代码描述
-------------------------------------------------
      Git中使用一个简单的Demo来演示效果。完成功能：
	1. 直接按home键回到后台     — 程序锁屏 
            2. 直接按电源键锁屏            —程序锁屏
	3.双击Home键进入Task列表 	— （列表中）程序锁屏
	4.在Task列表中选择demo程序     — 程序自动解锁
	5.在Task列表中选择demo程序以外的程序后，返回domo程序 	—  程序锁屏

 	AppDelegate.swift    —主要的逻辑判断区
	ViewController.swift  — 需要被锁屏的画面
            BulletProofScreenViewController.swift   —simple锁屏画面


Code functions and solved problems

The lock screen processing technique is applied to iOS applications with higher security requirements, this is a real pain point of our clients.
For applications with higher data security requirements, customers usually require the application to have the following logic: 
(1) from active state - to - > hang state after the lock screen processing (for example: entering the background / switching other programs from the Task list). 
(2) after the first operation, verify the user identity again (PinCode verification) after the suspending state - returning to active state.
Many applications only implement the lock screen after entering the pending state, but when the application enters the Task list (double click the Home key), the application is still displayed as active in the task list!
How can we lock our applications in multi-faceted way, and control the lock / unlock screen more intelligent in the same time? In addition to 1 and 2, let's check out if this technique can do extra work 
(3) from the active state - into - > Task list after the lock screen is displayed from the operation of the third to the original application (that is, not switching to other programs), and automatically unlock the screen


Code description
A simple Demo is used in Git to demonstrate the effect, here is the function what this code can do: 
1. press the home key directly back to the background - splashScreen.
2. press the power button directly lock the screen - splashScreen.
3. double click the Home key to enter the Task list - auto unlock.
4. select demo program in Task list automatically unlock program - auto unlock
5. after selecting the program apart from demo program in the Task list, return to the Domo program -  splashScreen.


AppDelegate.swift - the main logical judgment area
ViewController.swift - screen that needs to be locked
BulletProofScreenViewController.swift - simple lock screen
