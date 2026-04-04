# Codebase-to-Course Skill 中文化改造计划

## 目标

将 codebase-to-course skill 改造为默认生成简体中文课程网站，遵循以下原则：
- 所有 learner-facing content 默认输出中文
- 代码、路径、函数名、类名、变量名、API 字段名、命令等保持原文
- 技术术语首次出现时使用"中文（English）"格式
- 模板和脚本里的硬编码英文提示统一改成中文
- styles.css 增加适合中文显示的字体 fallback
- 保持原有结构、样式、交互和构建逻辑基本不变

## 需要修改的文件清单

### 核心文件（必须修改）

1. **SKILL.md** - Skill 主定义文件
   - 修改 description 字段为中文
   - 修改所有章节标题和说明文字
   - 保持代码示例、文件路径、命令等原文
   - 技术术语使用"中文（English）"格式

2. **references/main.js** - JavaScript 交互引擎
   - 修改注释为中文
   - 修改用户可见的提示文本（如"Pick an answer first!"、"Exactly!"等）
   - 保持函数名、变量名、API 调用等原文

3. **references/_base.html** - HTML 基础模板
   - 修改 `lang="en"` 为 `lang="zh-CN"`
   - 修改注释为中文
   - 保持 HTML 结构、CSS 类名、JavaScript 引用等原文

4. **references/styles.css** - 样式文件
   - 修改注释为中文
   - 在字体定义中增加中文字体 fallback（如 "PingFang SC", "Microsoft YaHei", "Noto Sans SC"）
   - 保持所有 CSS 规则和属性原文

### 参考文档文件（必须修改）

5. **references/content-philosophy.md** - 内容哲学指南
   - 修改所有内容为中文
   - 保持代码示例、HTML 标签、CSS 类名等原文

6. **references/module-brief-template.md** - 模块简介模板
   - 修改所有内容为中文
   - 保持文件路径、代码示例等原文

7. **references/gotchas.md** - 常见问题清单
   - 修改所有内容为中文
   - 保持技术术语、代码示例等原文

8. **references/interactive-elements.md** - 交互元素参考
   - 修改所有内容为中文
   - 保持 HTML 代码示例、CSS 类名、JavaScript API 等原文

9. **references/design-system.md** - 设计系统参考
   - 修改所有内容为中文
   - 保持 CSS 代码示例、颜色值、字体名等原文

### 辅助文件（必须修改）

10. **references/build.sh** - 构建脚本
    - 修改注释和输出信息为中文
    - 保持 shell 命令原文

11. **README.md** - 项目说明文档
    - 修改所有内容为中文
    - 保持文件路径、命令、技术术语等原文

## 详细修改步骤

### 步骤 1: 修改 SKILL.md

**修改内容：**
1. Line 2-3: description 字段改为中文
2. Line 6-8: 标题和简介改为中文
3. Line 10-22: First-Run Welcome 部分改为中文
4. Line 25-39: Who This Is For 部分改为中文
5. Line 41-50: Why This Approach Works 部分改为中文
6. Line 52-221: The Process 部分的所有说明文字改为中文
7. Line 199-210: Design Identity 部分改为中文
8. Line 213-221: Reference Files 部分改为中文

**保持不变：**
- 代码示例、文件路径、命令、技术术语的英文原文
- Markdown 格式和结构

### 步骤 2: 修改 references/main.js

**修改内容：**
1. Line 2-18: 注释部分改为中文
2. Line 185: "Pick an answer first!" → "请先选择一个答案！"
3. Line 193: "Exactly!" → "完全正确！"
4. Line 199: "Not quite." → "不太对。"
5. Line 306: "Drop here" → "拖放到这里"
6. Line 398: "Step" → "步骤"
7. Line 441: "Click \"Next Step\" to begin" → "点击"下一步"开始"
8. Line 473: "Found it!" → "找到了！"
9. Line 478: "Not this line — keep looking..." → "不是这一行，继续找..."

**保持不变：**
- 函数名、变量名、DOM API 调用、事件名称等

### 步骤 3: 修改 references/_base.html

**修改内容：**
1. Line 2: `lang="en"` → `lang="zh-CN"`
2. Line 6: 注释改为中文
3. Line 15-23: 注释部分改为中文
4. Line 42-48: 注释部分改为中文

**保持不变：**
- HTML 标签、属性名、CSS 类名、JavaScript 引用

### 步骤 4: 修改 references/styles.css

**修改内容：**
1. Line 1-6: 注释部分改为中文
2. Line 8-10: 注释部分改为中文
3. Line 48-50: 字体定义增加中文字体 fallback：
   ```css
   --font-display: 'Bricolage Grotesque', Georgia, "PingFang SC", "Microsoft YaHei", serif;
   --font-body:    'DM Sans', -apple-system, "PingFang SC", "Microsoft YaHei", "Noto Sans SC", sans-serif;
   --font-mono:    'JetBrains Mono', 'Fira Code', 'Consolas', monospace;
   ```

**保持不变：**
- 所有 CSS 规则、属性、值

### 步骤 5: 修改 references/content-philosophy.md

**修改内容：**
- 所有章节标题和说明文字改为中文
- 技术术语使用"中文（English）"格式

**保持不变：**
- 代码示例、HTML 标签、CSS 类名

### 步骤 6: 修改 references/module-brief-template.md

**修改内容：**
- 所有内容改为中文

**保持不变：**
- 文件路径、代码示例

### 步骤 7: 修改 references/gotchas.md

**修改内容：**
- 所有内容改为中文

**保持不变：**
- 技术术语、代码示例

### 步骤 8: 修改 references/interactive-elements.md

**修改内容：**
- 所有章节标题和说明文字改为中文

**保持不变：**
- HTML 代码示例、CSS 类名、JavaScript API

### 步骤 9: 修改 references/design-system.md

**修改内容：**
- 所有章节标题和说明文字改为中文

**保持不变：**
- CSS 代码示例、颜色值、字体名

### 步骤 10: 修改 references/build.sh

**修改内容：**
- Line 2: 注释改为中文
- Line 6: 输出信息改为中文

**保持不变：**
- Shell 命令

### 步骤 11: 修改 README.md

**修改内容：**
- 所有内容改为中文

**保持不变：**
- 文件路径、命令、技术术语

## 验证步骤

修改完成后，执行以下验证：

1. **文件完整性检查**
   - 确认所有文件都已修改
   - 确认文件结构未改变

2. **代码功能验证**
   - 检查 main.js 中的函数名、变量名未被修改
   - 检查 styles.css 中的 CSS 规则未被破坏
   - 检查 _base.html 的 HTML 结构完整

3. **构建测试**
   - 运行 build.sh 脚本，确认能正常生成 index.html
   - 在浏览器中打开生成的课程，检查：
     - 中文字体显示正常
     - 交互功能正常（测验、动画、工具提示等）
     - 样式无异常

4. **内容审查**
   - 检查所有用户可见文本已中文化
   - 检查技术术语使用了"中文（English）"格式
   - 检查代码、路径、命令等保持原文

## 注意事项

1. **不要修改的内容**
   - 函数名、变量名、类名
   - 文件路径和目录结构
   - HTML 标签名和属性名
   - CSS 属性名和值
   - JavaScript API 调用
   - 代码示例中的代码内容

2. **技术术语处理**
   - 首次出现时使用"中文（English）"格式
   - 例如："变量（variable）"、"函数（function）"、"API 端点（endpoint）"

3. **字体 fallback**
   - 中文字体应放在英文字体之后
   - 确保中英文混排时显示效果良好

4. **保持一致性**
   - 同一术语在不同文件中的翻译应保持一致
   - 语气和风格应保持一致

## 预期成果

完成所有修改后，skill 将：
1. 默认生成中文课程网站
2. 保持原有功能和交互逻辑
3. 中文字体显示优美
4. 技术术语准确且易懂
5. 代码示例保持原汁原味
