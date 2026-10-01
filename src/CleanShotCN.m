#import <AppKit/AppKit.h>

static NSDictionary<NSString *, NSString *> *CNTranslationMap(void) {
    static NSDictionary<NSString *, NSString *> *map;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        map = @{
            @"General": @"通用",
            @"Wallpaper": @"壁纸",
            @"Shortcuts": @"快捷键",
            @"Quick Access": @"快速访问",
            @"Recording": @"录制",
            @"Screenshots": @"截图",
            @"Annotate": @"标注",
            @"Cloud": @"云",
            @"Advanced": @"高级",
            @"About": @"关于",

            @"Startup:": @"启动:",
            @"Start at login": @"登录时启动",
            @"Sounds:": @"声音:",
            @"Play sounds": @"播放声音",
            @"Shutter sound:": @"快门声:",
            @"Menu bar:": @"菜单栏:",
            @"Show icon": @"显示图标",
            @"Export location:": @"导出位置:",
            @"Desktop icons:": @"桌面图标:",
            @"Hide while capturing": @"截图时隐藏",
            @"After capture:": @"截图后:",
            @"Here you can decide what should happen after taking a screenshot or recording a video.": @"在这里设置截图或录屏完成后的后续操作。",
            @"Screenshot": @"截图",
            @"Action": @"操作",
            @"Show Quick Access Overlay": @"显示快速访问浮层",
            @"Copy file to clipboard": @"复制文件到剪贴板",
            @"Save": @"保存",
            @"Upload to Cloud & copy link": @"上传到云并复制链接",
            @"Open Annotate tool": @"打开标注工具",
            @"Pin to the screen": @"钉到屏幕",
            @"Open Video Editor": @"打开视频编辑器",
            @"Default": @"默认",
            @"Desktop": @"桌面",
            @"Choose...": @"选择...",
            @"None": @"无",
            @"Choose a wallpaper to display when desktop icons are hidden:": @"选择隐藏桌面图标时显示的壁纸:",
            @"Desktop wallpaper": @"桌面壁纸",
            @"Don't change the wallpaper when switching spaces": @"切换空间时不更换壁纸",
            @"Custom wallpaper:": @"自定义壁纸:",
            @"Plain color:": @"纯色:",
            @"Window screenshots:": @"窗口截图:",
            @"Transparent": @"透明",
            @"With wallpaper": @"带壁纸",
            @"Padding:": @"边距:",
            @"Min": @"最小",
            @"Max": @"最大",
            @"Shadow:": @"阴影:",
            @"Capture window shadow": @"捕捉窗口阴影",
            @"Hold ⌥ (option) while taking a screenshot to disable shadow.": @"截图时按住 ⌥ (option) 可临时关闭阴影。",

            @"Position on screen:": @"屏幕位置:",
            @"Left": @"左侧",
            @"Multi-display:": @"多显示器:",
            @"Move to active screen": @"移动到当前屏幕",
            @"Active screen is the screen where your cursor is pointing.": @"当前屏幕是鼠标指针所在的屏幕。",
            @"Overlay size:": @"浮层大小:",
            @"Auto-close:": @"自动关闭:",
            @"Enable": @"启用",
            @"Action:": @"操作:",
            @"Save and Close": @"保存并关闭",
            @"Interval:": @"间隔:",
            @"30 seconds": @"30 秒",
            @"Drag & drop:": @"拖放:",
            @"Close after dragging": @"拖放后关闭",
            @"Cloud upload:": @"云上传:",
            @"Close after uploading": @"上传后关闭",
            @"Save button behavior:": @"保存按钮行为:",
            @"Save to \"Export location\"": @"保存到“导出位置”",

            @"Video": @"视频",
            @"GIF": @"GIF",
            @"Retina:": @"Retina:",
            @"Scale Retina videos to 1x": @"将 Retina 视频缩放为 1x",
            @"Notifications:": @"通知:",
            @"\"Do Not Disturb\" while recording": @"录制时开启“勿扰”",
            @"Cursor:": @"光标:",
            @"Highlight clicks": @"高亮点击",
            @"Display recording time": @"显示录制时长",
            @"Controls:": @"控制项:",
            @"Show controls while recording": @"录制时显示控制项",
            @"Options...": @"选项...",
            @"Keyboard:": @"键盘:",
            @"Show keystrokes": @"显示按键",
            @"Show cursor": @"显示光标",
            @"Recording area:": @"录制区域:",
            @"Remember last selection": @"记住上次选择",
            @"Dim screen while recording": @"录制时调暗屏幕",
            @"Show countdown": @"显示倒计时",
            @"Max resolution:": @"最大分辨率:",
            @"Original": @"原始",
            @"Set maximum resolution to reduce file size and upload time.": @"设置最大分辨率以减小文件大小和上传时间。",
            @"Video FPS:": @"视频帧率:",
            @"Audio:": @"音频:",
            @"Computer Audio Settings...": @"电脑音频设置...",
            @"Record audio in mono": @"以单声道录制音频",
            @"Video Encoder:": @"视频编码器:",
            @"Open Video Editor after recording": @"录制后打开视频编辑器",
            @"Use Video Editor to change the recording quality, resolution and adjust audio settings.": @"使用视频编辑器更改录制质量、分辨率并调整音频设置。",
            @"GIF FPS:": @"GIF 帧率:",
            @"GIF quality:": @"GIF 质量:",
            @"Optimize GIFs": @"优化 GIF",
            @"Low": @"低",
            @"High": @"高",
            @"GIF size:": @"GIF 尺寸:",
            @"800 x auto (default)": @"800 x 自动（默认）",
            @"Set maximum resolution of your GIFs. Changing it will affect file size and quality. CleanShot will only downscale the GIF if needed.": @"设置 GIF 的最大分辨率。更改此项会影响文件大小和质量。CleanShot 只会在需要时缩小 GIF。",
            @"Setting the quality to maximum can speed up the processing time, but it will increase file size.": @"将质量设为最高可加快处理速度，但会增加文件大小。",

            @"Self-Timer interval:": @"延时截图间隔:",
            @"5 Seconds": @"5 秒",
            @"Crosshair mode:": @"十字准星模式:",
            @"Show on screenshots": @"在截图中显示",
            @"Scale Retina screenshots to 1x": @"将 Retina 截图缩放为 1x",
            @"Color management:": @"色彩管理:",
            @"Convert to sRGB profile": @"转换为 sRGB 色彩配置",
            @"Frame:": @"边框:",
            @"Add 1px border to all screenshots": @"为所有截图添加 1px 边框",
            @"Background:": @"背景:",
            @"Freeze screen:": @"冻结屏幕:",
            @"Freeze screen when taking a screenshot": @"截图时冻结屏幕",
            @"Show magnifier": @"显示放大镜",
            @"Disabled": @"关闭",
            @"File format:": @"文件格式:",
            @"Need more precision?": @"需要更精确？",
            @"Automagically select objects to capture with PixelSnap.": @"使用 PixelSnap 自动选择要捕捉的对象。",
            @"Learn more": @"了解更多",
            @"Learn more...": @"了解更多...",
            @"This works in Fullscreen or Self-Timer modes only.": @"仅适用于全屏或延时截图模式。",
            @"Apply Background Tool preset to all screenshots. Create presets in Annotate. Hold ⇧ Shift while taking a screenshot to disable.": @"将背景工具预设应用到所有截图。可在标注中创建预设。截图时按住 ⇧ Shift 可临时关闭。",
            @"Use this option to capture hover states, animations, or fast-moving content.": @"用此选项捕捉悬停状态、动画或快速变化的内容。",

            @"Arrow tool:": @"箭头工具:",
            @"Inverse arrow direction": @"反转箭头方向",
            @"Press ⌥ (option) when drawing to invert the behavior.": @"绘制时按住 ⌥ (option) 可反转此行为。",
            @"Pencil tool:": @"铅笔工具:",
            @"Smooth drawing": @"平滑绘制",
            @"Background tool:": @"背景工具:",
            @"Remember if tool was opened": @"记住工具是否已打开",
            @"Draw shadow on objects": @"为对象绘制阴影",
            @"Canvas:": @"画布:",
            @"Automatically expand": @"自动扩展",
            @"Ensures all annotations fit by dynamically resizing canvas.": @"通过动态调整画布大小，确保所有标注都能放下。",
            @"Accessibility:": @"辅助功能:",
            @"Show color names": @"显示颜色名称",
            @"Window:": @"窗口:",
            @"Always on top": @"始终置顶",
            @"Show Dock icon": @"显示 Dock 图标",

            @"Sign In...": @"登录...",
            @"Create an Account...": @"创建账户...",
            @"Sign in to CleanShot Cloud": @"登录 CleanShot Cloud",
            @"Create a free account to upload your screenshots or screen recordings from the app.": @"创建免费账户，即可从应用上传截图或屏幕录制。",

            @"File name:": @"文件名:",
            @"Edit": @"编辑",
            @"Ask for name after every capture": @"每次捕捉后询问文件名",
            @"Add \"@2x\" suffix to Retina screenshots": @"为 Retina 截图添加“@2x”后缀",
            @"This option improves compatibility with displaying Retina screenshots in third-party apps.": @"此选项可提升 Retina 截图在第三方应用中的显示兼容性。",
            @"Copy to clipboard:": @"复制到剪贴板:",
            @"File & Image (default)": @"文件和图像（默认）",
            @"Adjust this option if you've encountered any issues with pasting from clipboard or clipboard managers.": @"如果从剪贴板或剪贴板管理器粘贴时遇到问题，可调整此选项。",
            @"Pinned screenshots:": @"钉图:",
            @"Rounded corners": @"圆角",
            @"Shadow": @"阴影",
            @"Border": @"边框",
            @"Keep history:": @"保留历史:",
            @"Never": @"永不",
            @"1 day": @"1 天",
            @"3 days": @"3 天",
            @"1 week": @"1 周",
            @"1 month": @"1 个月",
            @"You can restore old files with \"Capture History\" option from the menu bar.": @"可通过菜单栏中的“截图历史”恢复旧文件。",
            @"Text recognition:": @"文字识别:",
            @"Language:": @"语言:",
            @"Keep line breaks": @"保留换行",
            @"Detect links": @"检测链接",
            @"API:": @"API:",
            @"Allow applications to control CleanShot": @"允许应用控制 CleanShot",
            @"Dialogs:": @"对话框:",
            @"Reset All Warning Dialogs": @"重置所有警告对话框",

            @"⚙️  General": @"⚙️  通用",
            @"All-In-One:": @"全能截图:",
            @"Toggle Desktop Icons:": @"切换桌面图标:",
            @"Open Capture History:": @"打开截图历史:",
            @"Restore Last Capture:": @"恢复上次截图:",
            @"📸  Screenshots": @"📸  截图",
            @"Capture Area:": @"区域截图:",
            @"Capture Previous Area:": @"截取上一区域:",
            @"Capture Fullscreen:": @"全屏截图:",
            @"Capture Window:": @"窗口截图:",
            @"Self-Timer:": @"延时截图:",
            @"Capture Area & Copy to Clipboard:": @"区域截图并复制到剪贴板:",
            @"Capture Area & Save:": @"区域截图并保存:",
            @"Capture Area & Upload to Cloud:": @"区域截图并上传到云:",
            @"Capture Area & Annotate:": @"区域截图并标注:",
            @"Capture Area & Pin to the Screen:": @"区域截图并钉到屏幕:",
            @"🎥  Screen Recording": @"🎥  屏幕录制",
            @"Record Screen / Stop Recording:": @"录屏 / 停止录制:",
            @"Select Window:": @"选择窗口:",
            @"Start Video Recording:": @"开始视频录制:",
            @"Start GIF Recording:": @"开始 GIF 录制:",
            @"Pause/Resume Recording:": @"暂停 / 继续录制:",
            @"Restart Recording:": @"重新录制:",
            @"Toggle Camera Fullscreen:": @"切换摄像头全屏:",
            @"🖱  Scrolling Capture": @"🖱  滚动截图",
            @"Scrolling Capture:": @"滚动截图:",
            @"Start/Stop Capturing:": @"开始 / 停止捕捉:",
            @"🔤  OCR": @"🔤  文字识别",
            @"Capture Text:": @"文字识别:",
            @"Capture Text With Line Breaks:": @"文字识别并保留换行:",
            @"Capture Text Without Line Breaks:": @"文字识别不保留换行:",
            @"🖼️  Quick Access Overlay": @"🖼️  快速访问浮层",
            @"Hide/Show Overlays:": @"显示 / 隐藏浮层:",
            @"Save All Overlays:": @"保存所有浮层:",
            @"Close All Overlays:": @"关闭所有浮层:",
            @"📌  Pin": @"📌  钉图",
            @"Choose and Pin an Image:": @"选择并钉住图片:",
            @"Toggle Pins Visibility:": @"显示 / 隐藏钉图:",
            @"Close All Pins:": @"关闭所有钉图:",
            @"Pin Last Screenshot:": @"钉住上一张截图:",
            @"📝  Annotate": @"📝  标注",
            @"Open File:": @"打开文件:",
            @"Open From Clipboard:": @"从剪贴板打开:",
            @"Annotate Last Screenshot:": @"标注上一张截图:",
            @"Copy Object to Clipboard:": @"复制对象到剪贴板:",
            @"Duplicate Object:": @"复制对象:",
            @"Save:": @"保存:",
            @"Save as:": @"另存为:",
            @"Copy Screenshot to Clipboard:": @"复制截图到剪贴板:",
            @"Upload to Cloud:": @"上传到云:",
            @"Print:": @"打印:",
            @"Pin to the Screen:": @"钉到屏幕:",
            @"Add New Screenshot:": @"新增截图:",
            @"Add Screenshot From File:": @"从文件添加截图:",
            @"✏️  Annotate tools": @"✏️  标注工具",
            @"Increase Tool Size:": @"增大工具尺寸:",
            @"Decrease Tool Size:": @"减小工具尺寸:",
            @"Background Tool:": @"背景工具:",
            @"Move Tool:": @"移动工具:",
            @"Crop & Resize Tool:": @"裁剪和调整大小工具:",
            @"Draw Tool:": @"绘制工具:",
            @"Highlighter Tool:": @"高亮工具:",
            @"Line Tool:": @"直线工具:",
            @"Text Tool:": @"文本工具:",
            @"Arrow Tool:": @"箭头工具:",
            @"Counter Tool:": @"编号工具:",
            @"Ellipse Tool:": @"椭圆工具:",
            @"Redaction Tool:": @"遮盖工具:",
            @"Spotlight Tool:": @"聚光灯工具:",
            @"Rectangle Tool:": @"矩形工具:",
            @"Filled Rectangle Tool:": @"实心矩形工具:",
            @"Record shortcut": @"记录快捷键",
            @"Restore Defaults": @"恢复默认",
            @"Use System Default Shortcuts...": @"使用系统默认快捷键...",

            @"Check for Updates": @"检查更新",
            @"Visit our Website": @"访问网站",
            @"Contact Us": @"联系我们",
            @"Share my usage statistics": @"分享使用统计",
            @"Help us improve CleanShot by allowing us to collect completely anonymous usage data.": @"允许收集完全匿名的使用数据，帮助改进 CleanShot。",
            @"License Manager": @"许可证管理",
            @"Acknowledgments": @"致谢",
            @"Unlink Device": @"解绑设备",
            @"What's New": @"更新内容",
            @"Automatically check for updates": @"自动检查更新",

            @"Automatically Detect Language": @"自动检测语言",
            @"Hold ⇧ Shift while taking a screenshot to get a transparent background.": @"截图时按住 ⇧ Shift 可获得透明背景。",
            @"Hold ⌥ (option) to keep the item on Overlay after dragging.": @"拖放后按住 ⌥ (option) 可将项目保留在浮层中。",
            @"Press with ⌥ (option) to choose the destination.": @"按住 ⌥ (option) 点击可选择保存位置。",
            @"Disable this option to prevent external apps from controlling CleanShot via URL scheme API.": @"关闭此选项可阻止外部应用通过 URL 协议 API 控制 CleanShot。",

            @"App": @"应用",
            @"Launch at login": @"登录时启动",
            @"Show menu bar icon": @"显示菜单栏图标",
            @"Capture": @"捕捉",
            @"Hide desktop icons while capturing": @"捕捉时隐藏桌面图标",
            @"You can set a custom wallpaper to hide desktop icons in [wallpaper settings](%@).": @"可在[壁纸设置](%@)中设置自定义壁纸，以隐藏桌面图标。",
            @"You can set a custom wallpaper to hide desktop icons in [wallpaper settings](cleanshot-preferences://wallpaper).": @"可在[壁纸设置](cleanshot-preferences://wallpaper)中设置自定义壁纸，以隐藏桌面图标。",
            @"You can set a custom wallpaper to hide desktop icons in wallpaper settings.": @"可在壁纸设置中设置自定义壁纸，以隐藏桌面图标。",
            @"wallpaper settings": @"壁纸设置",
            @"Sounds": @"声音",
            @"System Default": @"系统默认",
            @"Classic": @"经典",
            @"Subtle": @"轻柔",
            @"Pop": @"清脆",
            @"Big Sur": @"Big Sur",
            @"Export": @"导出",
            @"Export location": @"导出位置",
            @"Set the default save location used when saving from the Quick Access Overlay, After Capture, and other Save actions across the app.": @"设置快速访问浮层、捕捉完成后及应用中其他保存操作使用的默认保存位置。",
            @"After Capture": @"捕捉完成后",
            @"Decide what should happen after taking a screenshot or recording a video.": @"设置截图或录屏完成后的操作。",
            @"At least one action needs to be enabled": @"至少需要启用一项操作",
            @"Please select at least one thing that should happen after capturing your screen.": @"请选择至少一项捕捉屏幕后执行的操作。",
            @"You've selected two actions that use the clipboard. Choose what should be copied.": @"所选两项操作都会使用剪贴板，请选择要复制的内容。",
            @"File & Cloud link": @"文件和云链接",
            @"The menu bar icon will be hidden.": @"菜单栏图标将被隐藏。",
            @"In order to show the Settings window again, launch CleanShot twice.": @"如需再次打开设置窗口，请连续启动 CleanShot 两次。",
            @"Screen Recording": @"屏幕录制",
            @"All-In-One": @"全能截图",
            @"OCR": @"文字识别",
            @"Pin": @"贴图",
            @"Annotate tools": @"标注工具",
            @"Video Editor": @"视频编辑器",
            @"Quick Access Overlay": @"快速访问浮层",
            @"Search shortcuts": @"搜索快捷键",
            @"No shortcuts match \"%@\"": @"没有与“%@”匹配的快捷键",
            @"Options": @"选项",
            @"Use System Default Shortcuts": @"使用系统默认快捷键",
            @"Ignore \"After Capture\" actions when using \"Capture Area & %@\" shortcuts": @"使用“区域截图并%@”快捷键时忽略“捕捉完成后”操作",
            @"Selection Tool": @"选择工具",
            @"Cut Tool": @"切割工具",
            @"Split Clip at Playhead": @"在播放头处分割片段",
            @"Split Zoom at Playhead": @"在播放头处分割缩放",
            @"Deselect All": @"取消全选",
            @"Zoom Timeline In": @"放大时间轴",
            @"Zoom Timeline Out": @"缩小时间轴",
            @"Zoom Timeline to Fit": @"使时间轴适合窗口",
            @"Fit Timeline to View": @"使时间轴适合窗口",
            @"Toggle Full Screen": @"切换全屏",
            @"Export Video": @"导出视频",
            @"Export Video & Upload to Cloud": @"导出视频并上传到云",
            @"Export Current Frame as Image": @"将当前帧导出为图像",
            @"Move Playhead to Previous Frame": @"播放头移至上一帧",
            @"Move Playhead to Next Frame": @"播放头移至下一帧",
            @"Move Playhead Back 10 Frames": @"播放头后退 10 帧",
            @"Move Playhead Forward 10 Frames": @"播放头前进 10 帧",
            @"Move Playhead to Previous Clip Edge": @"播放头移至上一个片段边界",
            @"Move Playhead to Next Clip Edge": @"播放头移至下一个片段边界",
            @"Move Playhead to Start": @"播放头移至开头",
            @"Move Playhead to End": @"播放头移至结尾",
            @"Capture Area & Send to Raycast AI Chat": @"区域截图并发送到 Raycast AI Chat",
            @"Appearance": @"外观",
            @"Behavior": @"行为",
            @"Right": @"右侧",
            @"Auto-close": @"自动关闭",
            @"Close": @"关闭",
            @"Ask for destination": @"询问保存位置",
            @"Hold %@ (option) to keep the item on Overlay after dragging.": @"拖放时按住 %@ (option) 可将项目保留在浮层中。",
            @"Hold %@ (option) to close the item from Overlay after dragging.": @"拖放时按住 %@ (option) 可关闭浮层中的项目。",
            @"Press with %@ (option) to choose the destination.": @"按住 %@ (option) 点击可选择保存位置。",
            @"Press with %@ (option) to use 'Export Location' without asking.": @"按住 %@ (option) 点击可直接保存到“导出位置”。",
            @"Set a custom wallpaper used to hide desktop icons and as the background behind window screenshots.": @"设置自定义壁纸，用于隐藏桌面图标及作为窗口截图的背景。",
            @"Update wallpaper when switching Spaces": @"切换桌面空间时更新壁纸",
            @"Custom wallpaper": @"自定义壁纸",
            @"Plain color": @"纯色",
            @"Output": @"输出",
            @"Background preset": @"背景预设",
            @"Apply Background Tool preset to all screenshots. You can create presets in Annotate. Hold ⇧ Shift while capturing a screenshot to disable this option.": @"将背景工具预设应用到所有截图。可在标注工具中创建预设。截图时按住 ⇧ Shift 可临时关闭此选项。",
            @"Apply Background Tool preset to all screenshots. You can create presets in Annotate. Hold %@ Shift while capturing a screenshot to disable this option.": @"将背景工具预设应用到所有截图。可在标注工具中创建预设。截图时按住 %@ Shift 可临时关闭此选项。",
            @"Show cursor on screenshots": @"在截图中显示光标",
            @"Window Screenshots": @"窗口截图",
            @"Background": @"背景",
            @"Hold %@ Shift while taking a screenshot to get a transparent background.": @"截图时按住 %@ Shift 可获得透明背景。",
            @"You can customize the wallpaper in [wallpaper settings](%@).": @"可在[壁纸设置](%@)中自定义壁纸。",
            @"You can customize the wallpaper in wallpaper settings.": @"可在壁纸设置中自定义壁纸。",
            @"Hold ⇧ Shift while taking a screenshot to get a transparent background. You can customize the wallpaper in wallpaper settings.": @"截图时按住 ⇧ Shift 可获得透明背景。可在壁纸设置中自定义壁纸。",
            @"Hold ⇧ Shift while taking a screenshot to get a transparent background.\nYou can customize the wallpaper in wallpaper settings.": @"截图时按住 ⇧ Shift 可获得透明背景。\n可在壁纸设置中自定义壁纸。",
            @"Reset Defaults": @"恢复默认",
            @"Crosshair": @"十字准星",
            @"Crosshair Mode": @"十字准星模式",
            @"To enable magnifier, you must enable Crosshair Mode first.": @"请先启用十字准星模式，再启用放大镜。",
            @"Precise": @"精确",
            @"Full Screen": @"全屏",
            @"Cursor": @"光标",
            @"Keystrokes": @"按键显示",
            @"Display recording time in menu bar": @"在菜单栏显示录制时长",
            @"Frame rate": @"帧率",
            @"Audio": @"音频",
            @"Audio tracks": @"音轨",
            @"Single track": @"单音轨",
            @"Separate tracks": @"分离音轨",
            @"Record system audio": @"录制系统音频",
            @"Enable this option to record sound that comes from other applications.": @"启用后可录制其他应用播放的声音。",
            @"Choose separate tracks to edit the microphone and system audio independently in video editing software.": @"选择分离音轨，可在视频编辑软件中分别编辑麦克风和系统音频。",
            @"Resolution": @"分辨率",
            @"Quality": @"质量",
            @"Size": @"大小",
            @"Color": @"颜色",
            @"Style": @"样式",
            @"Outline": @"轮廓",
            @"Filled": @"填充",
            @"System Accent color": @"系统强调色",
            @"Animate clicks": @"点击动画",
            @"Click here to preview": @"点击此处预览",
            @"Done": @"完成",
            @"Preview": @"预览",
            @"Dark": @"深色",
            @"Light": @"浅色",
            @"Position": @"位置",
            @"Top-Left": @"左上",
            @"Top-Center": @"上方居中",
            @"Top-Right": @"右上",
            @"Bottom-Left": @"左下",
            @"Bottom-Center": @"下方居中",
            @"Bottom-Right": @"右下",
            @"Keys": @"按键",
            @"Show only command keys": @"仅显示命令按键",
            @"Show all keys": @"显示所有按键",
            @"Blur background": @"模糊背景",
            @"Tools": @"工具",
            @"Remember if background tool was opened": @"记住背景工具的打开状态",
            @"Automatically expand canvas": @"自动扩展画布",
            @"Press %@ (option) when drawing to invert the behavior.": @"绘制时按住 %@ (option) 可反转此行为。",
            @"Window": @"窗口",
            @"Accessibility": @"辅助功能",
            @"File Name": @"文件名",
            @"File name format": @"文件名格式",
            @"Customize": @"自定义",
            @"Clipboard": @"剪贴板",
            @"Capture History": @"捕捉历史",
            @"Text Recognition": @"文字识别",
            @"Pinned Screenshots": @"贴图",
            @"Allow URL scheme API": @"允许 URL 协议 API",
            @"URL scheme API": @"URL 协议 API",
            @"Disable this option to prevent external apps from controlling CleanShot via [URL scheme API](%@).": @"关闭此选项可阻止外部应用通过 [URL 协议 API](%@) 控制 CleanShot。",
            @"Other": @"其他",
            @"Language": @"语言",
            @"Chinese (Simplified)": @"简体中文",
            @"Chinese (Traditional)": @"繁体中文",
            @"English": @"英语",
            @"Japanese": @"日语",
            @"Korean": @"韩语",
            @"French": @"法语",
            @"German": @"德语",
            @"Spanish": @"西班牙语",
            @"Portuguese": @"葡萄牙语",
            @"Italian": @"意大利语",
            @"Russian": @"俄语",
            @"Updates": @"更新",
            @"License": @"许可证",
            @"Links": @"链接",
            @"Website": @"官方网站",
            @"Changelog": @"更新日志",
            @"Analytics": @"使用统计",
            @"© MTW 2018-2026. All Rights Reserved.": @"© MTW 2018-2026。保留所有权利。",
            @"© MTW 2018-%@. All Rights Reserved.": @"© MTW 2018-%@。保留所有权利。",
            @"© MTW 2018-%lld. All Rights Reserved.": @"© MTW 2018-%lld。保留所有权利。",
            @"Manage Account": @"管理账户",
            @"Sign in": @"登录",
            @"Sign In": @"登录",
            @"Create an Account": @"创建账户",
            @"Upgrade to Pro": @"升级到 Pro",
            @"Unlimited storage": @"无限存储空间",
            @"Show recently uploaded media": @"显示最近上传的文件",
            @"Copy link when upload starts": @"上传开始时复制链接",
            @"CleanShot Cloud link": @"CleanShot Cloud 链接",
            @"Download link (Pro)": @"下载链接（Pro）",
            @"Screenshot quality": @"截图质量",
            @"Optimized for sharing": @"优化以便分享",
            @"The \"Optimized for sharing\" option offers perfect balance between quality and loading time.": @"“优化以便分享”选项可兼顾画质与加载速度。",
            @"Ask for name & show advanced options": @"询问名称并显示高级选项",
            @"Set name, tags and other options for every upload. You can also access this feature by holding %@ (option) while clicking the upload button.": @"为每次上传设置名称、标签等选项。也可按住 %@ (option) 点击上传按钮以使用此功能。",
            @"View more settings on CleanShot Cloud": @"在 CleanShot Cloud 中查看更多设置",
            @"Notification Settings": @"通知设置",
            @"Allow Notifications": @"允许通知",
            @"Type text and drag elements to create a custom format:": @"输入文本并拖入下方元素，以创建自定义格式：",
            @"Year": @"年份",
            @"Year:": @"年份：",
            @"Month (numeric)": @"月份（数字）",
            @"Month (numeric):": @"月份（数字）：",
            @"Month (name)": @"月份（名称）",
            @"Month (name):": @"月份（名称）：",
            @"Day": @"日期",
            @"Day:": @"日期：",
            @"Day of week": @"星期",
            @"Day of week:": @"星期：",
            @"Hour": @"小时",
            @"Hour:": @"小时：",
            @"Minutes": @"分钟",
            @"Minutes:": @"分钟：",
            @"Seconds": @"秒",
            @"Seconds:": @"秒：",
            @"AM/PM": @"上午/下午",
            @"AM/PM:": @"上午/下午：",
            @"Window title": @"窗口标题",
            @"Window title:": @"窗口标题：",
            @"App name": @"应用名称",
            @"App name:": @"应用名称：",
            @"Random characters": @"随机字符",
            @"Random characters:": @"随机字符：",
            @"Auto-increment": @"自动递增",
            @"Auto-increment:": @"自动递增：",
            @"Preview:": @"预览：",
            @"Auto-increment next number:": @"下一个递增编号：",
            @"Use UTC time zone": @"使用 UTC 时区",
            @"Remove illegal characters": @"移除非法字符",
            @"OK": @"确定",
            @"Cancel": @"取消",
            @"Preferences": @"设置",
            @"Preferences...": @"设置...",
            @"Settings": @"设置",
            @"About CleanShot...": @"关于 CleanShot...",
            @"Activate...": @"激活...",
            @"Quit": @"退出",
            @"Open": @"打开",
            @"Open File": @"打开文件",
            @"Open from Clipboard": @"从剪贴板打开",
            @"Capture Text (OCR)": @"识别文字（OCR）",
            @"Capture Text": @"识别文字",
            @"Record Screen": @"录制屏幕",
            @"Hide Desktop Icons": @"隐藏桌面图标",
            @"Show Desktop Icons": @"显示桌面图标",
            @"Open Capture History": @"打开捕捉历史",
            @"Open Annotation Tool...": @"打开标注工具...",
            @"Open Video Editor...": @"打开视频编辑器...",
            @"Extract text": @"提取文字",
            @"Rotate Left": @"向左旋转",
            @"Flip Horizontal": @"水平翻转",
            @"Resize...": @"调整大小...",
            @"Scale Retina to 1x": @"将 Retina 缩放为 1x",
            @"Upload to Cloud": @"上传到云",
            @"Upload to Cloud with Options": @"上传到云并设置选项",
            @"Quick Look": @"快速查看",
            @"Open Quick Look (Space)": @"快速查看（空格键）",
            @"Print": @"打印",
            @"Save as": @"另存为",
            @"Save As...": @"另存为...",
            @"Pin to the Screen": @"贴到屏幕",
            @"Open With": @"打开方式",
            @"Open in Mail...": @"在邮件中打开...",
            @"Move to Trash": @"移到废纸篓",
            @"Show in Finder": @"在访达中显示",
            @"Reveal in Finder": @"在访达中显示",
            @"Share": @"共享",
            @"Temporarily Hide": @"暂时隐藏",
            @"Copy": @"复制",
            @"Cut": @"剪切",
            @"Paste": @"粘贴",
            @"Delete": @"删除",
            @"Undo": @"撤销",
            @"Redo": @"重做",
            @"Select All": @"全选",
            @"Find": @"查找",
            @"Find and Replace": @"查找与替换",
            @"Find Next": @"查找下一个",
            @"Find Previous": @"查找上一个",
            @"Use Selection for Find": @"使用所选内容查找",
            @"Jump to Selection": @"跳到所选内容",
            @"Paste and Match Style": @"粘贴并匹配样式",
            @"Spelling and Grammar": @"拼写和语法",
            @"Show Spelling and Grammar": @"显示拼写和语法",
            @"Check Document Now": @"立即检查文稿",
            @"Check Spelling While Typing": @"输入时检查拼写",
            @"Check Grammar With Spelling": @"同时检查语法和拼写",
            @"Correct Spelling Automatically": @"自动更正拼写",
            @"Spelling": @"拼写",
            @"Substitutions": @"替换",
            @"Show Substitutions": @"显示替换选项",
            @"Smart Copy/Paste": @"智能复制/粘贴",
            @"Smart Quotes": @"智能引号",
            @"Smart Dashes": @"智能破折号",
            @"Smart Links": @"智能链接",
            @"Data Detectors": @"数据检测器",
            @"Text Replacement": @"文本替换",
            @"Transformations": @"文本转换",
            @"Make Upper Case": @"转为大写",
            @"Make Lower Case": @"转为小写",
            @"Capitalize": @"首字母大写",
            @"Speech": @"语音",
            @"Start Speaking": @"开始朗读",
            @"Stop Speaking": @"停止朗读",
            @"Show preferences": @"打开设置",
            @"Copy to Clipboard": @"复制到剪贴板",
            @"View All Uploads...": @"查看所有上传文件...",
            @"Clear History...": @"清空历史...",
            @"No files to restore...": @"没有可恢复的文件...",
            @"Capture History is disabled.": @"捕捉历史已关闭。",
            @"Don't ask for confirmation": @"不再询问确认",
            @"No text detected": @"未检测到文字",
            @"Text has been copied": @"文字已复制",
            @"Link has been copied": @"链接已复制",
            @"Do you want to open this link?": @"是否打开此链接？",
            @"Open Link in Browser": @"在浏览器中打开链接",
            @"Never open links": @"不打开链接",
            @"Record Microphone": @"录制麦克风",
            @"Record microphone": @"录制麦克风",
            @"Record System Audio": @"录制系统音频",
            @"Don't Record Audio": @"不录制音频",
            @"Do Not Record Microphone": @"不录制麦克风",
            @"Highlight Clicks": @"高亮点击",
            @"Record in Studio Mode": @"以工作室模式录制",
            @"Studio Mode": @"工作室模式",
            @"Stop Recording": @"停止录制",
            @"Pause Recording": @"暂停录制",
            @"Resume Recording": @"继续录制",
            @"Start Recording": @"开始录制",
            @"Start Capturing": @"开始捕捉",
            @"Stop Capturing": @"停止捕捉",
            @"Capture Area": @"区域截图",
            @"Capture Window": @"窗口截图",
            @"Capture Fullscreen": @"全屏截图",
            @"Self-Timer": @"延时截图",
            @"Draw": @"绘制",
            @"Move": @"移动",
            @"Rectangle": @"矩形",
            @"Filled Rectangle": @"实心矩形",
            @"Ellipse": @"椭圆",
            @"Arrow": @"箭头",
            @"Line": @"直线",
            @"Text": @"文本",
            @"Redact": @"遮盖",
            @"Spotlight": @"聚光灯",
            @"Counter": @"编号",
            @"Highlighter": @"荧光笔",
            @"Choose From File...": @"从文件选择...",
            @"Paste From Clipboard": @"从剪贴板粘贴",
            @"Choose export location": @"选择导出位置",
            @"Choose export location and exit": @"选择导出位置并退出",
            @"Upload to Cloud and exit": @"上传到云并退出",
            @"Send to Raycast AI Chat": @"发送到 Raycast AI Chat",
            @"Send To Raycast AI Chat...": @"发送到 Raycast AI Chat...",
            @"Revert to Original": @"还原为原始图像",
            @"Add New Preset...": @"添加新预设...",
            @"Enter preset name:": @"输入预设名称：",
            @"Apply Previous Settings": @"应用上次设置",
            @"Automatically apply preset to all screenshots:": @"自动将预设应用到所有截图：",
            @"Save changes to the preset": @"将更改保存到预设",
            @"Update with Current Color": @"使用当前颜色更新",
            @"Add to My Colors": @"添加到我的颜色",
            @"Custom Color...": @"自定义颜色...",
            @"Background color": @"背景颜色",
            @"Lock and hide screenshot on mouse over": @"锁定截图并在鼠标悬停时隐藏",
            @"Place on the right": @"放在右侧",
            @"Place on the left": @"放在左侧",
            @"Place on the top": @"放在上方",
            @"Place on the bottom": @"放在下方",
            @"Width": @"宽度",
            @"Height": @"高度",
            @"Keep aspect ratio": @"保持宽高比",
            @"Resize": @"调整大小",
            @"Crop": @"裁剪",
            @"Reset": @"重置",
            @"Apply": @"应用",
            @"Opacity": @"不透明度",
            @"Zoom": @"缩放",
            @"Follow Cursor": @"跟随光标",
            @"Animation Settings": @"动画设置",
            @"Animations": @"动画",
            @"Camera": @"摄像头",
            @"Shrink camera on zoom": @"缩放时缩小摄像头画面",
            @"Ripple animation": @"涟漪动画",
            @"Hide cursor when not moving": @"静止时隐藏光标",
            @"Hide cursor when typing": @"输入时隐藏光标",
            @"System audio volume": @"系统音频音量",
            @"Microphone volume": @"麦克风音量",
            @"Include system audio": @"包含系统音频",
            @"Include microphone": @"包含麦克风音频",
            @"Apply Zoom Level to All": @"将缩放级别应用到全部",
            @"Remove All Zooms": @"移除全部缩放",
            @"Enter Full Screen": @"进入全屏",
            @"Close Full Screen": @"退出全屏",
            @"Export & Upload to Cloud": @"导出并上传到云",
            @"Save as New Video": @"另存为新视频",
            @"Remove the Audio": @"移除音频",
            @"Cancel Processing...": @"取消处理...",
            @"Trimming video...": @"正在裁剪视频...",
            @"Exporting video": @"正在导出视频",
            @"Uploading video": @"正在上传视频",
            @"Preparing upload": @"正在准备上传",
            @"Recording screen": @"正在录制屏幕",
            @"Press to stop recording": @"点击停止录制",
            @"Drag to select capture area.": @"拖动以选择捕捉区域。",
            @"Move cursor here to start scrolling": @"将光标移到此处以开始滚动",
            @"This operation cannot be undone.": @"此操作无法撤销。",
            @"This action will flatten all annotations, making them uneditable.": @"此操作会合并所有标注，之后将无法单独编辑。",
            @"Do you want to save the changes you made to the screenshot?": @"是否保存对截图的更改？",
            @"Your changes will be lost if you don't save it.": @"不保存将丢失所做的更改。",
            @"Your changes will be lost if you don't save them.": @"不保存将丢失所做的更改。",
            @"Do you want to save the changes made to this project?": @"是否保存对项目的更改？",
            @"Do you want to save your project before closing?": @"是否在关闭前保存项目？",
            @"Do you want to replace the existing video?": @"是否替换现有视频？",
            @"Do you want to trim the video?": @"是否裁剪视频？",
            @"Your changes will be lost if you exit.": @"退出后将丢失所做的更改。",
            @"Are you sure you want to remove the audio track?": @"确定要移除音轨吗？",
            @"Are you sure you want to delete this recording?": @"确定要删除此录制吗？",
            @"Are you sure you want to cancel this recording and start a new one?": @"确定要取消当前录制并开始新的录制吗？",
            @"Are you sure you want to close this recording?": @"确定要关闭此录制吗？",
            @"You may lose the file if it hasn't been saved.": @"如果文件尚未保存，关闭后可能会丢失。",
            @"Do you want to close all overlays?": @"是否关闭所有浮层？",
            @"Your media will be lost if you didn't save it.": @"未保存的文件将会丢失。",
            @"Are you sure you want to delete all files from history?": @"确定要删除历史中的所有文件吗？",
            @"Are you sure you want to stop the uploading?": @"确定要停止上传吗？",
            @"The upload progress will be lost.": @"当前上传进度将会丢失。",
            @"The upload is still in progress. Do you want to cancel it?": @"上传仍在进行中，是否取消？",
            @"The export is still in progress. Do you want to cancel it?": @"导出仍在进行中，是否取消？",
            @"The export is still in progress. You'll need to start over if you stop now.": @"导出仍在进行中，现在停止将需要重新开始。",
            @"The upload is still in progress. You'll need to start over if you stop now.": @"上传仍在进行中，现在停止将需要重新开始。",
            @"All warning dialogs are now enabled.": @"已启用所有警告对话框。",
            @"All warning dialogs that can be disabled by checking \"Don't show again\" are now enabled, and will be shown the next time they are applicable.": @"已重新启用所有通过“不再显示”关闭的警告对话框，下次符合条件时会再次显示。",
            @"Don't show again": @"不再显示",
            @"Don't ask again": @"不再询问",
            @"Don't warn me again": @"不再提醒",
            @"Got it!": @"知道了！",
            @"Learn More": @"了解更多",
            @"Your microphone is muted": @"麦克风已静音",
            @"Microphone is muted": @"麦克风已静音",
            @"No microphone selected": @"未选择麦克风",
            @"The built-in microphone cannot be used when the MacBook lid is closed.": @"MacBook 合盖时无法使用内置麦克风。",
            @"You've enabled camera recording, but no microphone is selected. Select a mic to include sound in your video.": @"已启用摄像头录制，但未选择麦克风。请选择麦克风以在视频中录制声音。",
            @"CleanShot does not have access to the microphone": @"CleanShot 无权访问麦克风",
            @"Please give CleanShot access to your microphone in order to record your voice or system audio.": @"请允许 CleanShot 访问麦克风，以录制语音或系统音频。",
            @"Open System Settings": @"打开系统设置",
            @"CleanShot requires Screen Recording permission": @"CleanShot 需要屏幕录制权限",
            @"In order to continue working properly, CleanShot needs Screen Recording permission.": @"CleanShot 需要屏幕录制权限才能正常工作。",
            @"Please open the Privacy & Security panel in System Settings and enable CleanShot in the Screen Recording section.": @"请打开系统设置中的“隐私与安全性”，在“屏幕录制”中允许 CleanShot。",
            @"Keystroke customization is only available for videos recorded in Studio Mode.": @"只有在工作室模式下录制的视频才能自定义按键显示。",
            @"No keystrokes were captured in this video.": @"此视频未记录按键。",
            @"Camera customization is only available for videos recorded in Studio Mode.": @"只有在工作室模式下录制的视频才能自定义摄像头画面。",
            @"Camera recording was disabled for this recording.": @"此次录制未启用摄像头。",
            @"Cursor customization is only available for videos recorded in Studio Mode.": @"只有在工作室模式下录制的视频才能自定义光标。",
            @"Follow Cursor is only available for videos recorded in Studio Mode.": @"只有在工作室模式下录制的视频才能使用光标跟随。",
            @"Record your video in Studio Mode to use this option.": @"请在工作室模式下录制视频以使用此选项。",
            @"This video has no audio.": @"此视频没有音频。",
            @"No microphone was selected for this recording.": @"此次录制未选择麦克风。",
            @"CleanShot recovered your recording": @"CleanShot 已恢复录制文件",
            @"Application quit unexpectedly, but your recording was recovered and saved to the export location.": @"应用意外退出，但录制文件已恢复并保存到导出位置。",
            @"Recording Stopped": @"录制已停止",
            @"Screen Recording stopped unexpectedly.": @"屏幕录制意外停止。",
            @"An error occurred with screen recording.": @"屏幕录制发生错误。",
            @"Your free disk space is low.": @"磁盘可用空间不足。",
            @"The recording might stop unexpectedly and you may lose the file.": @"录制可能意外停止，文件也可能丢失。",
            @"Recording stopped because your disk is almost full.": @"磁盘即将满，录制已停止。",
            @"The recording was stopped to prevent data loss. Free up some disk space before recording again.": @"为避免数据丢失，录制已停止。请释放磁盘空间后再录制。",
            @"Microphone Disconnected": @"麦克风已断开",
            @"Your microphone has been disconnected during the recording. Do you want to continue recording without audio or stop the recording?": @"录制期间麦克风已断开。是否继续无声录制，或停止录制？",
            @"Continue Without Audio": @"继续无声录制",
            @"Audio Recording Failed": @"音频录制失败",
            @"Unable to capture system audio. Do you want to continue recording without audio or stop the recording?": @"无法录制系统音频。是否继续无声录制，或停止录制？",
            @"Looks like your Internet connection is down.": @"网络连接似乎已断开。",
            @"Cloud Upload Disabled": @"云上传已禁用",
            @"Uploading to the cloud has been disabled by your organization. Contact your administrator if you need access.": @"你的组织已禁用云上传。如需使用，请联系管理员。",
            @"There was an error while logging in.": @"登录时发生错误。",
            @"There was an error while uploading your file.": @"上传文件时发生错误。",
            @"There was an error while uploading your image.": @"上传图像时发生错误。",
            @"The service is currently under maintenance.": @"服务正在维护中。",
            @"You need to log in first.": @"请先登录。",
            @"Update uploaded screenshot": @"更新已上传的截图",
            @"Do you want to update the screenshot in Cloud?": @"是否更新云端截图？",
            @"Can't restore any files": @"无法恢复文件",
            @"CleanShot X couldn't find any recent captures to restore.": @"CleanShot X 未找到可恢复的近期捕捉文件。",
            @"An error occurred while opening the file": @"打开文件时发生错误",
            @"An error occurred while opening the project": @"打开项目时发生错误",
            @"An error occurred while saving the project": @"保存项目时发生错误",
            @"An error occurred while processing the video file.": @"处理视频文件时发生错误。",
            @"An error occurred while starting screen recording.": @"启动屏幕录制时发生错误。",
            @"Compatibility warning": @"兼容性警告",
            @"Something went wrong saving your file.": @"保存文件时发生错误。",
            @"Export was canceled.": @"导出已取消。",
            @"The video cannot be trimmed. Please try again.": @"无法裁剪视频，请重试。",
            @"The video will not be trimmed.": @"视频将保持原样，不进行裁剪。",
            @"Your video is uploaded. The link has been copied to your clipboard.": @"视频已上传，链接已复制到剪贴板。",
            @"Could not save the current frame as an image.": @"无法将当前帧保存为图像。",
            @"Scale image to fit on one page": @"缩放图像以适合一页",
            @"Scale to fit on one page": @"缩放以适合一页",
            @"These options are unavailable for window screenshots.": @"窗口截图无法使用这些选项。",
            @"Click or drag to add zoom": @"点击或拖动以添加缩放",
            @"Scroll Vertically or Horizontally": @"纵向或横向滚动",
            @"You can capture content in both vertical and horizontal orientations, but you can't switch directions during capture.": @"可以纵向或横向捕捉内容，但捕捉过程中不能切换方向。",
            @"Slowly scroll down the content": @"缓慢向下滚动内容",
            @"You'll see a preview of your screenshot updated in real time. Scrolling too fast might result in breaking the capture process.": @"截图预览会实时更新。滚动过快可能导致捕捉中断。",
            @"How to select an area?": @"如何选择区域？",
            @"Only scrollable content should be selected. Any non-moving parts or scroll bar should not be present in your selection.": @"只选择可滚动的内容，不要包含固定区域或滚动条。",
            @"How to use the text recognition tool?": @"如何使用文字识别工具？",
            @"Welcome to CleanShot X": @"欢迎使用 CleanShot X",
            @"Tweak your workflow": @"自定义工作流程",
            @"I'll do it later": @"稍后再说",
            @"Hide desktop icons": @"隐藏桌面图标",
            @"Set as default screenshot tool?": @"设为默认截图工具？",
            @"Use the same shortcut as macOS?": @"使用与 macOS 相同的快捷键？",
            @"Sign up for free": @"免费注册",
            @"Create a free account": @"创建免费账户",
            @"CleanShot is ready to use!": @"CleanShot 已准备就绪！",
        };

        NSMutableDictionary<NSString *, NSString *> *expanded = [map mutableCopy];
        for (NSString *key in map) {
            NSString *value = map[key];
            if ([key hasSuffix:@":"] && ![key containsString:@"\n"]) {
                NSString *plainKey = [key substringToIndex:key.length - 1];
                if (!expanded[plainKey]) {
                    expanded[plainKey] = [value substringToIndex:value.length - 1];
                }
            }
            if ([key hasSuffix:@"..."]) {
                NSString *plainKey = [key substringToIndex:key.length - 3];
                NSString *plainValue = [value hasSuffix:@"..."] ? [value substringToIndex:value.length - 3] : value;
                expanded[[plainKey stringByAppendingString:@"…"]] = [plainValue stringByAppendingString:@"…"];
                if (!expanded[plainKey]) expanded[plainKey] = plainValue;
            }
        }
        for (NSString *key in [expanded.allKeys copy]) {
            if (![key hasSuffix:@"..."] && ![key hasSuffix:@"…"] && ![key containsString:@"\n"]) {
                expanded[[key stringByAppendingString:@"…"]] = [expanded[key] stringByAppendingString:@"…"];
                expanded[[key stringByAppendingString:@"..."]] = [expanded[key] stringByAppendingString:@"..."];
            }
        }
        map = [expanded copy];
    });

    return map;
}

static NSString *CNLookup(NSString *s) {
    if (s.length == 0) return nil;
    return CNTranslationMap()[s];
}

static NSString *CNTranslate(NSString *s) {
    if (s.length == 0) return s;

    NSString *direct = CNLookup(s);
    if (direct) return direct;

    NSCharacterSet *ws = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [s stringByTrimmingCharactersInSet:ws];
    NSString *trimmedTranslation = CNLookup(trimmed);
    if (!trimmedTranslation) return s;

    NSRange trimRange = [s rangeOfString:trimmed];
    if (trimRange.location == NSNotFound) return trimmedTranslation;

    NSMutableString *result = [s mutableCopy];
    [result replaceCharactersInRange:trimRange withString:trimmedTranslation];
    return result;
}

static void CNTranslateMenu(NSMenu *menu) {
    for (NSMenuItem *item in menu.itemArray) {
        NSString *translated = CNTranslate(item.title);
        if (translated && ![translated isEqualToString:item.title]) {
            item.title = translated;
        }
        if (item.submenu) CNTranslateMenu(item.submenu);
    }
}

static BOOL CNSkipMutableOrShortcutView(NSView *view) {
    NSString *className = NSStringFromClass(view.class);
    NSArray<NSString *> *blocked = @[
        @"KeyboardShortcut",
        @"SecureTextField",
        @"SearchField",
        @"ComboBox",
        @"TextView"
    ];

    if ([view isKindOfClass:[NSTokenField class]]) return YES;

    for (NSString *part in blocked) {
        if ([className rangeOfString:part options:NSCaseInsensitiveSearch].location != NSNotFound) {
            return YES;
        }
    }

    if (view.identifier.length > 0) {
        NSString *identifier = view.identifier;
        if ([identifier rangeOfString:@"shortcut" options:NSCaseInsensitiveSearch].location != NSNotFound ||
            [identifier rangeOfString:@"hotkey" options:NSCaseInsensitiveSearch].location != NSNotFound) {
            return YES;
        }
    }

    return NO;
}

static void CNTranslateView(NSView *view) {
    if (CNSkipMutableOrShortcutView(view)) {
        return;
    }

    if (view.toolTip.length > 0) {
        NSString *translated = CNTranslate(view.toolTip);
        if (![translated isEqualToString:view.toolTip]) view.toolTip = translated;
    }

    if ([view isKindOfClass:[NSTextField class]]) {
        NSTextField *field = (NSTextField *)view;
        if (!field.isEditable && [field isMemberOfClass:[NSTextField class]]) {
            NSString *translated = CNTranslate(field.stringValue);
            if (translated && ![translated isEqualToString:field.stringValue]) {
                field.stringValue = translated;
            }
        }
    }

    if ([view isKindOfClass:[NSButton class]]) {
        NSButton *button = (NSButton *)view;
        NSString *translated = CNTranslate(button.title);
        if (translated && ![translated isEqualToString:button.title]) {
            button.title = translated;
        }
    }

    if ([view isKindOfClass:[NSBox class]]) {
        NSBox *box = (NSBox *)view;
        NSString *translated = CNTranslate(box.title);
        if (![translated isEqualToString:box.title]) box.title = translated;
    }

    if ([view isKindOfClass:[NSPopUpButton class]]) {
        NSPopUpButton *popup = (NSPopUpButton *)view;
        CNTranslateMenu(popup.menu);
    }

    if ([view isKindOfClass:[NSTabView class]]) {
        NSTabView *tabView = (NSTabView *)view;
        for (NSTabViewItem *item in tabView.tabViewItems) {
            NSString *translated = CNTranslate(item.label);
            if (translated && ![translated isEqualToString:item.label]) {
                item.label = translated;
            }
        }
    }

    if ([view isKindOfClass:[NSTableView class]]) {
        NSTableView *table = (NSTableView *)view;
        for (NSTableColumn *column in table.tableColumns) {
            NSString *translated = CNTranslate(column.headerCell.stringValue);
            if (translated && ![translated isEqualToString:column.headerCell.stringValue]) {
                column.headerCell.stringValue = translated;
            }
        }

        NSRange visibleRows = [table rowsInRect:table.visibleRect];
        if (visibleRows.location != NSNotFound) {
            NSUInteger end = NSMaxRange(visibleRows);
            for (NSUInteger row = visibleRows.location; row < end; row++) {
                for (NSUInteger col = 0; col < table.numberOfColumns; col++) {
                    NSView *cellView = [table viewAtColumn:col row:row makeIfNecessary:NO];
                    if (cellView) CNTranslateView(cellView);
                }
            }
        }
    }

    for (NSView *subview in view.subviews) {
        CNTranslateView(subview);
    }
}

static void CNTranslateWindow(NSWindow *window) {
    NSString *translatedTitle = CNTranslate(window.title);
    if (translatedTitle && ![translatedTitle isEqualToString:window.title]) {
        window.title = translatedTitle;
    }

    for (NSToolbarItem *item in window.toolbar.items) {
        NSString *label = CNTranslate(item.label);
        if (label && ![label isEqualToString:item.label]) item.label = label;

        NSString *palette = CNTranslate(item.paletteLabel);
        if (palette && ![palette isEqualToString:item.paletteLabel]) item.paletteLabel = palette;

        if (item.toolTip.length > 0) {
            NSString *tip = CNTranslate(item.toolTip);
            if (tip && ![tip isEqualToString:item.toolTip]) item.toolTip = tip;
        }
    }

    if (window.contentView) CNTranslateView(window.contentView);
}

static void CNTranslateVisibleUI(void) {
    if (NSApp.mainMenu) CNTranslateMenu(NSApp.mainMenu);
    for (NSWindow *window in NSApp.windows) {
        CNTranslateWindow(window);
    }
}

#ifndef CLEANSHOT_CN_EXPORT
__attribute__((constructor))
static void CleanShotCNInit(void) {
    @autoreleasepool {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] addObserverForName:NSMenuDidBeginTrackingNotification
                                                              object:nil
                                                               queue:[NSOperationQueue mainQueue]
                                                          usingBlock:^(NSNotification *note) {
                CNTranslateMenu(note.object);
            }];

            [[NSNotificationCenter defaultCenter] addObserverForName:NSWindowDidBecomeKeyNotification
                                                              object:nil
                                                               queue:[NSOperationQueue mainQueue]
                                                          usingBlock:^(__unused NSNotification *note) {
                CNTranslateVisibleUI();
            }];

            [[NSNotificationCenter defaultCenter] addObserverForName:NSWindowDidUpdateNotification
                                                              object:nil
                                                               queue:[NSOperationQueue mainQueue]
                                                          usingBlock:^(__unused NSNotification *note) {
                CNTranslateVisibleUI();
            }];

            [NSTimer scheduledTimerWithTimeInterval:0.5
                                            repeats:YES
                                              block:^(__unused NSTimer *timer) {
                CNTranslateVisibleUI();
            }];

            [@"CleanShotCN runtime translator loaded\n" writeToFile:@"/tmp/cleanshot-cn.log"
                                                         atomically:YES
                                                           encoding:NSUTF8StringEncoding
                                                              error:nil];
        });
    }
}
#endif
