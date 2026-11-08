# SmartLightingApp 项目长期记忆

## 用户偏好 / 约定
- 简历与文档输出：严格不虚构数据与经历，缺失信息统一用【待补充】标注；语言专业、简洁、结果导向。
- 涉及「后端职责」时：本仓库只有客户端代码，不得自行把 ArkTS 客户端工作推断为后端开发经历；但 2026-11-08 用户明确指定按钮、语音输入相关功能及其对应逻辑归入后端负责范围（用户自述分工，按此撰写，不划归客户端/设备侧等其他角色）。
- 正式作答前每次只提一个澄清问题，需求明确后再给完整方案。

## 项目上下文基线
- HarmonyOS Stage 模型 ArkTS 单模块（entry）应用「智能照明系统」，bundleName com.example.project_text1，SDK 5.1.1(19)，phone/tablet，Hvigor / DevEco Studio。
- 入口链：EntryAbility.onWindowStageCreate → loadContent('pages/Index')；Index 用 AppStorageV2.connect(NavPathStack,'navStack') + Navigation，onAppear push 'Layout'；Layout 为底部 Tabs（Home=SOUY、Setting=WD）；SOUY 四个功能入口 push SW/DS/YY/ZDY。route_map.json 共 5 条；main_pages 只注册 Index；SOUY/WD 未注册路由。
- 分层：pages/ 8 个页面 → utils/device.ets（28 个设备静态数据；教学/实操/会议/休息 4 组场景、turn/turnoff、exper1）、utils/EasterEgg.ets（节拍彩蛋）、utils/SpeechRecognizerManager.ets（CoreSpeechKit）、utils/permissionMananger.ets；inter/HttpUtil.ets（单例；HTTP POST 表单 12 字段、时间戳 MD5 签名、9s 超时、批量与彩蛋控制核心）、inter/MD5.ets（TokenGenerator）、inter/PreferencesUtil.ets（device_settings_store / timer_tasks_store）、inter/Interface1.ets（类型中心）、inter/SmartHomeApi.ets（通用 httpGet/httpPost，响应不回传）、model/DataModel.ets（仅 ZDY 用）。
- 后端契约：HTTP REST，端点 /SmartHome/ShenDaRest/getLights 与 /controlLight；状态 '0'=开、'1'=关；设备类型 LIGHT_GROUP（下发亮度/色温/RGB）与 inSona_group（仅开关）；鉴权为 MD5(timestamp + 硬编码密钥) 小写令牌（密钥值不记录）；多个页面各自硬编码服务地址且两组 IP 混用；仓库内无服务端源码。
- 功能：场景切换、亮度/色温调节与按时段自动调节、分钟级定时任务、中文语音识别控制、单设备/批量开关、音乐节拍彩蛋；权限仅 INTERNET + MICROPHONE；EntryBackupAbility 空实现；src/test、src/ohosTest、mock-config.json5 均为模板占位。
- 文件操作口径：首轮分析要求不改动任何文件；2026-11-08 起用户切换 Agent 模式允许写文件，但默认仍以只读分析为主。
