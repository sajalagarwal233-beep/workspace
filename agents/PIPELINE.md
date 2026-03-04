# 🔄 Agent OS Pipeline - Supervisor Flow

## Overview
This pipeline coordinates multiple agents to complete a full content marketing workflow automatically.

---

## 📍 Pipeline Sequence

```
┌─────────┐    ┌─────────┐    ┌─────────┐    ┌─────────┐    ┌─────────┐
│  ALEx   │───▶│  MAYA   │───▶│   SAM   │───▶│ JORDAN  │───▶│  DONE   │
│Research │    │  Write  │    │  Social │    │ Strategy│    │         │
│         │    │  Blog   │    │  Posts  │    │ Promote │    │         │
└─────────┘    └─────────┘    └─────────┘    └─────────┘    └─────────┘
   1️⃣          2️⃣          3️⃣          4️⃣
```

---

## Step-by-Step Flow

### Step 1: Alex (Research)
- **Task:** Research the topic thoroughly
- **Output:** Research findings with 50+ sources
- **Passes to:** Maya

### Step 2: Maya (Content Writing)
- **Task:** Write SEO-optimized blog post based on research
- **Output:** 800+ word blog with meta description, headings, CTA
- **Passes to:** Sam

### Step 3: Sam (Social Media)
- **Task:** Create social posts from blog content
- **Output:** Instagram, LinkedIn, Twitter posts with hashtags
- **Passes to:** Jordan

### Step 4: Jordan (Marketing Strategy)
- **Task:** Create promotion/launch plan
- **Output:** 30/60/90 day action plan, monetization ideas
- **Complete!**

---

## 🚀 How to Trigger

### Command: "Run full pipeline on [topic]"
```
"Run full pipeline on cold email strategies"
"Full pipeline: remote work tools"
"Execute pipeline for AI productivity"
```

### Manual Trigger Words:
- "full pipeline"
- "complete workflow"
- "end-to-end"
- "from research to promotion"
- "complete marketing pipeline"

---

## Example Pipeline

**User says:**
> "Run full pipeline on cold email strategies"

**What happens:**

1. **Alex researches:**
   - Finds 50+ sources on cold email best practices
   - Compiles statistics, expert tips, tools
   - Passes to Maya

2. **Maya writes:**
   - Creates blog: "The Ultimate Guide to Cold Emails in 2026"
   - Includes SEO title, meta description, headings
   - Passes to Sam

3. **Sam creates posts:**
   - Instagram carousel about cold email tips
   - LinkedIn post sharing key insights
   - Twitter thread highlights
   - Passes to Jordan

4. **Jordan strategizes:**
   - 30/60/90 day promotion plan
   - Monetization ideas
   - Email campaign strategy
   - **Complete!**

---

## Pipeline States

| State | Meaning |
|-------|---------|
| 🔴 Not Started | Pipeline not triggered |
| 🟡 In Progress | Currently executing step |
| 🟢 Complete | All steps finished |

---

## Pipeline Commands

| Command | Action |
|---------|--------|
| "Run full pipeline on [topic]" | Start complete pipeline |
| "Run pipeline steps 1-2" | Only research + writing |
| "Start from step 3" | Skip to social media |
| "Pause pipeline" | Hold execution |
| "Resume pipeline" | Continue from pause |
| "Pipeline status" | Check current step |

---

## Output Locations

Each agent saves to their workspace:

```
/root/.openclaw/workspace/agents/
├── alex/
│   └── pipeline-research-[topic].md    # Step 1 output
├── maya/
│   └── pipeline-blog-[topic].md         # Step 2 output
├── sam/
│   └── pipeline-social-[topic].md        # Step 3 output
└── jordan/
    └── pipeline-strategy-[topic].md      # Step 4 output
```

---

## Continuity

- Each step loads previous agent's output
- Memory updates at each step
- Can resume from any step if interrupted
- Full audit trail in workspace
