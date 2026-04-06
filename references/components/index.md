# 组件索引

交互元素的快速参考。根据模块需要按需读取组件文件。

## 必需元素（每个课程必须包含）

| 元素 | 文件 | 用途 |
|------|------|------|
| 代码翻译 | [translation.html](translation.html) | 代码 ↔ 中文对照，每个模块至少一个 |
| 测验 | [quiz.html](quiz.html) | 多选测验，每个模块至少一个 |
| 群聊 | [chat.html](chat.html) | 组件对话动画，整个课程至少一个 |
| 数据流 | [flow.html](flow.html) | 数据流动画，整个课程至少一个 |
| 术语表 | [term.html](term.html) | 技术术语提示，每个术语首次出现时使用 |

## 可选元素

| 元素 | 文件 | 用途 |
|------|------|------|
| 场景测验 | [quiz-scenario.html](quiz-scenario.html) | "高级工程师会怎么做"情境题 |
| 拖放匹配 | [dnd.html](dnd.html) | 概念与描述匹配 |
| 架构图 | [architecture.html](architecture.html) | 系统架构展示 |
| 层切换 | [layer-toggle.html](layer-toggle.html) | 多层演示（HTML/CSS/JS） |
| 找错 | [bug-challenge.html](bug-challenge.html) | 调试练习 |
| 标注框 | [callout.html](callout.html) | "顿悟！"洞察，每模块最多 2 个 |
| 模式卡片 | [pattern-cards.html](pattern-cards.html) | 工程模式/技术栈展示 |
| 文件树 | [file-tree.html](file-tree.html) | 目录结构可视化 |
| 图标行 | [icon-rows.html](icon-rows.html) | 组件/特性列表 |
| 步骤卡片 | [step-cards.html](step-cards.html) | 流程步骤展示 |
| 徽章列表 | [badges.html](badges.html) | 配置/权限说明 |
| 流程图 | [flow-steps.html](flow-steps.html) | 水平流程展示 |

## 使用方式

1. 确定模块需要的交互元素
2. 只读取对应的组件文件
3. 复制模板并替换占位符

## 通用规则

- 所有 CSS 在 `styles.css` 中，不要内联样式
- 所有 JS 在 `main.js` 中，通过 `data-*` 属性连接
- 模块文件只包含 `<section>` 内容，不包含 `<html>`/`<head>`/`<body>`
