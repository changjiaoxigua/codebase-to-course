# Skill 组件化优化计划

## 问题分析

### 当前结构
```
references/
  ├── styles.css          (~500 行) - 预构建，直接复制 ✅
  ├── main.js             (~500 行) - 预构建，直接复制 ✅
  ├── _base.html          (~70 行)  - 外壳模板 ✅
  ├── _footer.html        (~10 行)  - 页脚 ✅
  ├── build.sh            (~10 行)  - 组装脚本 ✅
  ├── interactive-elements.md (~900 行) - 问题所在 ❌
  ├── design-system.md    (~400 行) - 设计令牌
  ├── content-philosophy.md       - 内容规则
  ├── gotchas.md                  - 常见问题
  └── module-brief-template.md    - 模块简介模板
```

### 核心问题

1. **interactive-elements.md 过大**（约 900 行）
   - 包含 17 种交互元素的完整 HTML 模式
   - 每次生成都需要读取整个文件
   - 很多元素可能不会被使用

2. **HTML 模式冗余**
   - 每个元素包含 CSS 和 JS 示例（已在 styles.css/main.js 中）
   - 大量重复的样板代码

3. **Token 消耗高**
   - 生成每个模块都需要读取完整参考文件
   - 没有按需加载机制

---

## 优化方案

### 方案概述：组件模板化 + 数据驱动

将交互元素拆分为独立组件文件，简化 HTML 模式，部分元素改为数据驱动。

### 阶段 1：拆分组件模板

**创建 `references/components/` 目录结构：**
```
references/components/
  ├── quiz.html              # 多选测验
  ├── quiz-scenario.html     # 场景测验
  ├── dnd.html               # 拖放匹配
  ├── chat.html              # 群聊动画
  ├── flow.html              # 数据流动画
  ├── architecture.html      # 架构图
  ├── layer-toggle.html      # 层切换
  ├── bug-challenge.html     # 找错挑战
  ├── callout.html           # 标注框
  ├── pattern-cards.html     # 模式卡片
  ├── translation.html       # 代码翻译块
  ├── file-tree.html         # 文件树
  ├── icon-rows.html         # 图标行
  ├── step-cards.html        # 步骤卡片
  ├── badges.html            # 徽章列表
  ├── flow-steps.html        # 流程图
  └── term.html              # 术语表工具提示
```

**每个组件文件只包含：**
- 简化的 HTML 模板
- 必要的 data-* 属性说明
- 使用示例（精简版）

**示例：quiz.html**
```html
<!-- 多选测验组件 -->
<!-- 用法：复制并替换 QUESTION、OPTIONS、CORRECT、EXPLANATION 占位符 -->

<div class="quiz-container" id="quiz-UNIQUE_ID">
  <div class="quiz-question-block"
       data-correct="CORRECT_OPTION"
       data-explanation-right="正确答案解释"
       data-explanation-wrong="错误答案解释">
    <h3 class="quiz-question">QUESTION_TEXT</h3>
    <div class="quiz-options">
      <button class="quiz-option" data-value="option-a" onclick="selectOption(this)">
        <div class="quiz-option-radio"></div>
        <span>OPTION_A</span>
      </button>
      <button class="quiz-option" data-value="option-b" onclick="selectOption(this)">
        <div class="quiz-option-radio"></div>
        <span>OPTION_B</span>
      </button>
      <button class="quiz-option" data-value="option-c" onclick="selectOption(this)">
        <div class="quiz-option-radio"></div>
        <span>OPTION_C</span>
      </button>
    </div>
    <div class="quiz-feedback"></div>
  </div>
  <button class="quiz-check-btn" onclick="checkQuiz('quiz-UNIQUE_ID')">检查答案</button>
  <button class="quiz-reset-btn" onclick="resetQuiz('quiz-UNIQUE_ID')">重试</button>
</div>
```

### 阶段 2：数据驱动的复杂组件

对于群聊和数据流动画，改为 JSON 数据驱动，由 JS 动态渲染。

**修改 main.js 添加渲染函数：**
```javascript
// 群聊渲染器
window.renderChat = function(containerId, messages) {
  const container = document.getElementById(containerId);
  // 根据 messages 数组动态生成 HTML
};

// 数据流渲染器
window.renderFlow = function(containerId, steps, actors) {
  const container = document.getElementById(containerId);
  // 根据 steps 和 actors 数组动态生成 HTML
};
```

**简化后的 HTML 使用方式：**
```html
<!-- 群聊：只需提供数据 -->
<div class="chat-window" id="chat-module2"></div>
<script>
renderChat('chat-module2', [
  { sender: 'frontend', name: '前端', text: '我需要数据...' },
  { sender: 'backend', name: '后端', text: '好的，我来处理...' }
]);
</script>
```

### 阶段 3：更新 SKILL.md

修改 SKILL.md 中的指令：

**当前流程：**
```
阅读 references/interactive-elements.md 了解每种交互元素类型的 HTML 模式
```

**优化后流程：**
```
根据模块需要的交互元素，按需阅读 references/components/ 中的组件文件：
- 测验：quiz.html 或 quiz-scenario.html
- 群聊：chat.html
- 数据流：flow.html
- ...等
```

### 阶段 4：创建组件索引

创建 `references/components/index.md` 作为快速参考：

```markdown
# 组件索引

## 必需元素（每个课程必须包含）
| 元素 | 文件 | 用途 |
|------|------|------|
| 代码翻译 | translation.html | 代码 ↔ 英语对照 |
| 测验 | quiz.html | 多选测验 |
| 群聊 | chat.html | 组件对话动画 |
| 数据流 | flow.html | 数据流动画 |
| 术语表 | term.html | 技术术语提示 |

## 可选元素
| 元素 | 文件 | 用途 |
|------|------|------|
| 架构图 | architecture.html | 系统架构展示 |
| 层切换 | layer-toggle.html | 多层演示 |
| 找错 | bug-challenge.html | 调试练习 |
| ... | ... | ... |
```

---

## 实施步骤

### 步骤 1：创建组件目录和文件
- 创建 `references/components/` 目录
- 将 interactive-elements.md 拆分为 17 个独立组件文件
- 每个文件只保留精简的 HTML 模板

### 步骤 2：更新 main.js
- 添加 `renderChat()` 和 `renderFlow()` 函数
- 支持数据驱动的动态渲染

### 步骤 3：更新 SKILL.md
- 修改阶段 3 的指令
- 改为按需读取组件文件
- 添加组件索引引用

### 步骤 4：删除或保留原文件
- 可选择保留 `interactive-elements.md` 作为完整参考
- 或删除以减少 token 消耗

### 步骤 5：更新其他参考文件
- 更新 `gotchas.md` 中的引用路径
- 更新 `module-brief-template.md` 中的组件引用

---

## 预期效果

### Token 节省估算

| 场景 | 当前 | 优化后 | 节省 |
|------|------|--------|------|
| 读取完整 interactive-elements.md | ~900 行 | - | - |
| 按需读取 3-4 个组件 | - | ~100-150 行 | ~80% |
| 简化 HTML 模板 | 每个元素 ~50 行 | 每个元素 ~15 行 | ~70% |

### 生成效率提升

1. **减少上下文大小**：只加载需要的组件
2. **简化模板**：移除冗余的 CSS/JS 示例
3. **数据驱动**：复杂组件通过 JSON 配置，减少手写 HTML

### 维护性提升

1. **独立组件**：修改一个组件不影响其他
2. **清晰索引**：快速找到需要的组件
3. **版本控制友好**：组件变更历史更清晰

---

## 风险和注意事项

1. **向后兼容**：保留原有的 HTML 模式支持，新增数据驱动方式
2. **文档同步**：确保 SKILL.md 和组件文件保持一致
3. **测试验证**：优化后需要测试生成效果是否一致

---

## 文件变更清单

### 新增文件
- `references/components/index.md` - 组件索引
- `references/components/quiz.html` - 测验组件
- `references/components/quiz-scenario.html` - 场景测验
- `references/components/dnd.html` - 拖放匹配
- `references/components/chat.html` - 群聊动画
- `references/components/flow.html` - 数据流动画
- `references/components/architecture.html` - 架构图
- `references/components/layer-toggle.html` - 层切换
- `references/components/bug-challenge.html` - 找错挑战
- `references/components/callout.html` - 标注框
- `references/components/pattern-cards.html` - 模式卡片
- `references/components/translation.html` - 代码翻译
- `references/components/file-tree.html` - 文件树
- `references/components/icon-rows.html` - 图标行
- `references/components/step-cards.html` - 步骤卡片
- `references/components/badges.html` - 徽章列表
- `references/components/flow-steps.html` - 流程图
- `references/components/term.html` - 术语表工具提示

### 修改文件
- `references/main.js` - 添加渲染函数
- `SKILL.md` - 更新流程指令

### 可选删除
- `references/interactive-elements.md` - 可保留作为完整参考
