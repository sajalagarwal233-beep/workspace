# agent-browser - Quick Reference

## Install
```bash
npm install -g agent-browser
agent-browser install
```

## Essential Commands (Token-Efficient)

### Always use these flags for snapshot:
```bash
agent-browser snapshot -i -c -d 3   # Interactive + Compact + Depth 3
```

### Basic Navigation
```bash
agent-browser open <url>           # Navigate (alias: goto)
agent-browser back                 # Go back
agent-browser forward             # Go forward
agent-browser reload              # Reload page
agent-browser close               # Close browser
```

### Interact
```bash
agent-browser click <ref>         # Click by ref (@e1)
agent-browser fill <ref> "text"   # Fill form
agent-browser type <ref> "text"   # Type into
agent-browser press <key>         # Press key (Enter, Tab)
agent-browser scroll up/down      # Scroll
agent-browser wait <ms>            # Wait
```

### Get Data
```bash
agent-browser get title           # Page title
agent-browser get url            # Current URL
agent-browser get text            # All text
agent-browser get text @e1        # Specific element
```

### Screenshot
```bash
agent-browser screenshot          # Take screenshot
agent-browser screenshot --annotate  # With labels
agent-browser screenshot --full   # Full page
```

### Find Elements
```bash
agent-browser find text "Submit" click
agent-browser find label "Email" fill "test@test.com"
agent-browser find role button click --name "Submit"
```

## Token-Saving Flags
```bash
-i          # Interactive elements only
-c          # Compact (remove empty)
-d <n>      # Depth limit
-s "#main"  # Scope to selector
```

## Session Management
```bash
agent-browser --session mysession open url
agent-browser state save mystate
agent-browser state load mystate
```

## Environment Variables
```bash
AGENT_BROWSER_SESSION_NAME=twitter   # Auto-save session
AGENT_BROWSER_MAX_OUTPUT=50000        # Limit output
AGENT_BROWSER_CONTENT_BOUNDARIES      # Safety markers
```
