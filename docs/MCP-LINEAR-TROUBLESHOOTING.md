# Linear MCP Troubleshooting for Cursor

If creating Linear tickets via `/new-spec` isn't working, follow these steps.

## 1. Verify Linear MCP is Connected

**Cursor Settings** → **Features** → **MCP** (or **Cursor Settings** → **MCP**)

- Linear should appear in the list of servers
- Status should be **Connected** (green) or **Running**
- If it shows **Disconnected** or **Error**: Click **Reload** or **Restart** the server

## 2. Enable Linear Tools for the Agent

When the AI uses MCP tools, Cursor may prompt you to approve. Ensure:

- **Create issue** (or `create_issue`) is enabled/allowed
- **Update issue** and **Add comment** if you want full workflow support

**How to check**: In Cursor MCP settings, click on the Linear server and view the list of available tools. Ensure write tools (create, update) are not disabled.

## 3. Try Cursor's One-Click Install

If manual config isn't working, use Linear's official Cursor install:

1. Go to [Linear Cursor Integration](https://linear.app/integrations/cursor-mcp)
2. Click the Cursor install link
3. Authorize with Linear when prompted
4. Restart Cursor

## 4. Use SSE Endpoint (Updated)

We've updated the config to use `https://mcp.linear.app/sse` (Cursor's recommended endpoint). If you previously used `/mcp`, the SSE endpoint may work better.

**Config locations**:
- Project: `.cursor/mcp.json`
- Global: `~/.cursor/mcp.json`

## 5. Clear OAuth Cache (If Wrong Workspace)

If Linear connects to the wrong workspace (e.g., Notch instead of CM Personal):

```bash
rm -rf ~/.mcp-auth
```

Then restart Cursor and re-authenticate when prompted.

## 6. Test Linear Manually

Before running `/new-spec`, verify Linear works:

**In Cursor Chat**, try:
```
Create a Linear ticket titled "Test MCP" with description "Testing Linear integration"
```

If this works, `/new-spec` should work. If not, the issue is with Linear MCP setup, not the new-spec command.

## 7. Check Cursor vs Claude Code

- **Cursor** uses `.cursor/mcp.json` and Cursor's MCP Settings UI
- **Claude Code** uses `.claude/settings.local.json` and `~/.claude/` config

If `/new-spec` works in Claude Code but not Cursor, the Linear MCP is configured for Claude Code. Configure it separately in Cursor (Settings → MCP).

## 8. Known Cursor MCP Issues

- Remote MCP can require multiple connection attempts
- Try: Disable Linear → Restart Cursor → Re-enable Linear
- Forum: [Linear MCP commonly errors out](https://forum.cursor.com/t/linear-mcp-commonly-errors-out-and-requires-turning-off-then-on/148816)

## 9. Fallback: Manual Ticket Creation

Until Linear MCP works in Cursor:

1. Run `/new-spec [feature]` — spec will be created
2. Create the Linear ticket manually in Linear
3. Add ticket URL and ID to the spec frontmatter
4. Optionally rename file to `{TICKET-ID}-{feature-slug}.md`
