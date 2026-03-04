# Complete Slack + OpenClaw Setup Guide

## Step 1: Create Slack App from Manifest

### Option A: Using Slack CLI (Recommended)
```bash
# Install Slack CLI
brew install slackcli/slack-cli/slack

# Create app from manifest
slack app create openclaw --manifest slack-manifest.json
```

### Option B: Manual via Slack Dashboard

1. Go to https://api.slack.com/apps
2. Click **"Create New App"** → **"From an app manifest"**
3. Select your workspace
4. Copy the contents of `slack-manifest.json` and paste into the YAML/JSON field
5. Click **"Next"** → **"Create"**

---

## Step 2: Enable Socket Mode

1. In your Slack app → **"Socket Mode"** (left sidebar)
2. Toggle **"Enable Socket Mode"** to ON
3. Click **"Generate Token"** to create an App Token
4. Copy the token (starts with `xapp-...`)
5. **Save this token!** You'll need it later

Required scopes for App Token:
- `connections:write` (should be auto-selected)

---

## Step 3: Install App to Workspace

1. Go to **"Install App"** (left sidebar)
2. Click **"Install to Workspace"**
3. Review permissions → **"Allow"**
4. Copy the **Bot User OAuth Token** (starts with `xoxb-...`)
5. **Save this token too!**

---

## Step 4: Subscribe to Events

1. Go to **"Event Subscriptions"** (left sidebar)
2. Toggle **"Enable Events"** to ON
3. Expand **"Subscribe to bot events"**
4. Add these events:
   - `app_mention` - When someone mentions @OpenClaw
   - `message.channels` - Messages in channels
   - `message.groups` - Messages in private channels
   - `message.im` - Direct messages
   - `message.mpim` - Group DMs
   - `reaction_added` - When someone reacts
   - `reaction_removed` - When someone removes reaction
5. Click **"Save Changes"**

---

## Step 5: Enable Interactivity

1. Go to **"Interactivity & Shortcuts"** (left sidebar)
2. Toggle **"Interactivity"** to ON
3. Click **"Request URL"** → Enter your gateway URL (see Step 6)
   - For local: you'll need a tunnel (ngrok)
   - Example: `https://your-ngrok.io/slack/events`
4. Click **"Save Changes"**

---

## Step 6: Set Up ngrok (For Local Development)

If running OpenClaw locally, you need a public URL:

```bash
# Install ngrok
brew install ngrok

# Authenticate
ngrok authtoken YOUR_AUTH_TOKEN

# Start tunnel to port 3000
ngrok http 3000

# Copy the HTTPS URL (e.g., https://abc123.ngrok.io)
```

Use this URL in Step 5 for Interactivity and Events.

---

## Step 7: Configure OpenClaw

### Option A: config.json
```json
{
  "channels": {
    "slack": {
      "enabled": true,
      "mode": "socket",
      "appToken": "xapp-your-app-token-here",
      "botToken": "xoxb-your-bot-token-here"
    }
  }
}
```

### Option B: Environment Variables
```bash
# Add to your environment
export SLACK_APP_TOKEN="xapp-your-app-token-here"
export SLACK_BOT_TOKEN="xoxb-your-bot-token-here"
```

### Option C: Using OpenClaw CLI
```bash
openclaw configure --channel slack --app-token xapp-... --bot-token xoxb-...
```

---

## Step 8: Start OpenClaw Gateway

```bash
# Start the gateway
openclaw gateway

# Check status
openclaw channels status

# View logs
openclaw logs --follow
```

---

## Step 9: Test the Connection

### In Slack:
1. Go to a channel where OpenClaw is installed
2. Type: `@OpenClaw hello`
3. Should get a response from your AI!

### In DM:
1. Search for "OpenClaw" in Slack
2. Start a direct message
3. Send a message

---

## Access Control Options

### DM Policy (Who can DM OpenClaw)
```json
{
  "channels": {
    "slack": {
      "dmPolicy": "pairing"  // Options: pairing, allowlist, open, disabled
    }
  }
}
```

### Channel Policy (Which channels)
```json
{
  "channels": {
    "slack": {
      "groupPolicy": "allowlist",
      "channels": {
        "C123456": {
          "requireMention": true
        }
      }
    }
  }
}
```

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "Socket mode not connecting" | Verify app token is correct and has `connections:write` |
| "Events not received" | Check ngrok tunnel is running |
| "DM messages ignored" | Check `dmPolicy` setting |
| "No replies in channel" | Verify channel is in allowlist or `groupPolicy` is open |
| "App mention not working" | Ensure `app_mention` event is subscribed |

### Diagnostic Commands
```bash
openclaw doctor
openclaw channels status --probe
openclaw pairing list slack
openclaw logs --level debug
```

---

## Advanced Features

### Slash Commands
```json
{
  "channels": {
    "slack": {
      "slashCommand": {
        "enabled": true,
        "name": "openclaw"
      }
    }
  }
}
```

### Reactions
```json
{
  "channels": {
    "slack": {
      "ackReaction": "eyes"
    }
  }
}
```

### Streaming Responses
```json
{
  "channels": {
    "slack": {
      "streaming": "partial",
      "nativeStreaming": true
    }
  }
}
```

---

## Complete Configuration Example

```json
{
  "channels": {
    "slack": {
      "enabled": true,
      "mode": "socket",
      "appToken": "xapp-...",
      "botToken": "xoxb-...",
      "dmPolicy": "pairing",
      "groupPolicy": "allowlist",
      "channels": {
        "C1234567890": {
          "requireMention": true
        }
      },
      "ackReaction": "eyes",
      "streaming": "partial",
      "nativeStreaming": true,
      "textChunkLimit": 4000
    }
  }
}
```

---

## Security Notes

1. **Never commit tokens to git** - Use environment variables
2. **Rotate tokens periodically** - Regenerate via Slack dashboard
3. **Limit channel access** - Use allowlist for production
4. **Monitor logs** - Check for unauthorized access

---

## Tokens Needed

| Token | Starts With | Where to Find |
|-------|-------------|---------------|
| App Token | `xapp-...` | Socket Mode settings |
| Bot Token | `xoxb-...` | OAuth & Permissions |
| Signing Secret | (32 chars) | Basic Information |

---

Done! Your Slack app is ready to connect with OpenClaw.
