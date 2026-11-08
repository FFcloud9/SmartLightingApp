/**
 * 数据模型定义文件
 * 包含应用程序中使用的所有接口和数据类型定义
 * 用于统一数据结构和类型检查
 */

/**
 * RGB颜色接口
 * 表示灯光的颜色配置，每个颜色分量范围为0-255
 */
export interface ColorRGB {
  r: number;  // 红色分量，范围：0-255
  g: number;  // 绿色分量，范围：0-255
  b: number;  // 蓝色分量，范围：0-255
}

/**
 * 灯光设备信息接口
 * 描述单个灯光设备的完整状态信息
 */
export interface LightDevice {
  deviceId: string;        // 设备唯一标识符
  deviceName: string;      // 设备显示名称（如：客厅主灯、卧室灯光）
  type: string;            // 设备类型（如：LIGHT_GROUP）
  status: boolean;         // 设备开关状态：true=开启，false=关闭
  brightness: number;      // 亮度百分比，范围：0-100
  color: ColorRGB;         // 当前颜色设置
  colorTemperature: number; // 色温值，范围：0-100
  lastUpdateTime: string;  // 最后更新时间，ISO格式字符串
}

/**
 * API响应接口
 * 标准化所有API调用的响应格式
 */
export interface ApiResponse {
  code: number;  // 响应状态码：1=成功，-1=失败，其他值可根据业务定义
  msg: string;   // 响应消息，描述操作结果
  re: string;    // 响应数据，通常包含具体的返回信息或错误详情
}

/**
 * 灯光控制参数接口
 * 定义发送到后端API的灯光控制请求参数
 */
export interface ControlParams {
  timestamp: string;        // 请求时间戳，用于认证和防重放
  token: string;           // 认证令牌，基于时间戳和密钥生成
  control_sub_id: string;  // 控制的子设备ID（目标灯光设备ID）
  control_sub_state: string; // 设备控制状态：'0'=打开，'1'=关闭
  r_channel?: number;      // 红色通道值，可选参数
  g_channel?: number;      // 绿色通道值，可选参数
  b_channel?: number;      // 蓝色通道值，可选参数
  w_channel?: number;      // 白光通道值（亮度控制），可选参数
  y_channel?: number;      // 黄光通道值（色温控制），可选参数
  control_state?: string;  // 控制状态，可选参数
  type_uuid: string;       // 设备类型UUID
  lightness?: number;      // 亮度值，可选参数（与w_channel可能重复，取决于API设计）
}

/**
 * 场景应用参数接口
 * 用于一次性应用完整的场景配置
 */
export interface SceneApplyParams {
  color: ColorRGB;           // 场景颜色配置
  brightness: number;        // 场景亮度配置，范围：0-100
  colorTemperature: number;  // 场景色温配置，范围：0-100
}