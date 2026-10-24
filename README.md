# EasyChat Server（本地部署版）

基于开源项目 [yetel/EasyChatServer](https://github.com/yetel/EasyChatServer)（Apache-2.0）的本地化部署版本。Spring Boot + Netty 实现的 IM 服务端，支持单聊、群聊、消息收发、图片发送。

## 技术栈

- Spring Boot + MyBatis + PageHelper
- Netty TCP 长连接，自定义二进制协议（长度字段 + 魔术值校验 + JSON 序列化）
- MySQL 持久化 + Redis 会话 token 存储
- Java 8

## 本地运行

1. 准备 MySQL 与 Redis，导入 `src/main/resources/sql/test.sql` 建表
2. 数据库凭证走环境变量（有默认值，可直接跑）：
   - `MYSQL_USER`（默认 root）
   - `MYSQL_PASSWORD`（默认 123456）
3. `spring.profiles.active` 已配置为 dev
4. 启动：

   ```bash
   mvn spring-boot:run
   ```

5. 端口：HTTP 服务 9004，Netty 长连接 8000

## 相对原版的改动

- **数据库凭证外置**：`application-dev.properties` 中账号密码改为 `${MYSQL_USER}` / `${MYSQL_PASSWORD}` 环境变量注入，不再硬编码
- **新增测试工具**（`tools/`）：
  - `start-test-env.bat`：测试环境一键启动
  - `run-server.bat`：服务启动脚本
  - `tcp_client.py`：Python TCP 客户端，用于登录与自定义协议联调
- 推送脚本等本地工具已清理，不入库

## 接口文档

见 `src/main/resources/readme/` 下的接口文档，表结构见 `src/main/resources/sql/test.sql`。

## 致谢与许可

原项目版权归 yetel 所有，遵循 Apache-2.0 许可，详见 [LICENSE](LICENSE)。
