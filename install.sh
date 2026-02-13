#!/usr/bin/env bash
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# claude-rules installer
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#
# Usage:
#   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ipmotionmc/claude-rules/main/install.sh)"
#
set -euo pipefail

# ── Change this to your repo ──
REMOTE_BASE="${CLAUDE_RULES_REMOTE:-https://raw.githubusercontent.com/ipmotionmc/claude-rules/main}"
INSTALL_DIR="${CLAUDE_RULES_HOME:-${HOME}/.local/bin}"
BIN_NAME="claude-rules"

RED='\033[0;31m'  GREEN='\033[0;32m'
YELLOW='\033[1;33m' BOLD='\033[1m'
DIM='\033[2m'     NC='\033[0m'

echo ""
printf "  ${BOLD}Installing claude-rules${NC}\n"
echo "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Create install dir
mkdir -p "$INSTALL_DIR"

# Download CLI
printf "  Downloading... "
if curl -fsSL "${REMOTE_BASE}/bin/${BIN_NAME}" -o "${INSTALL_DIR}/${BIN_NAME}" 2>/dev/null; then
  chmod +x "${INSTALL_DIR}/${BIN_NAME}"
  printf "${GREEN}done${NC}\n"
else
  printf "${RED}failed${NC}\n"
  echo ""
  printf "  ${RED}Could not download from:${NC}\n"
  echo "  ${REMOTE_BASE}/${BIN_NAME}"
  echo ""
  echo "  If you're installing from a local copy, run:"
  echo "    cp claude-rules ${INSTALL_DIR}/${BIN_NAME} && chmod +x ${INSTALL_DIR}/${BIN_NAME}"
  exit 1
fi

# Check PATH
if ! echo "$PATH" | tr ':' '\n' | grep -qx "$INSTALL_DIR"; then
  echo ""
  printf "  ${YELLOW}!${NC}  ${INSTALL_DIR} is not in your PATH.\n"
  echo "     Add this to your shell config (~/.bashrc or ~/.zshrc):"
  echo ""
  printf "     ${DIM}export PATH=\"${INSTALL_DIR}:\$PATH\"${NC}\n"
fi

echo ""
printf "  ${GREEN}✓${NC}  Installed ${BOLD}${BIN_NAME}${NC} to ${INSTALL_DIR}/${BIN_NAME}\n"
echo ""
echo "  Get started:"
echo "    cd your-project"
echo "    claude-rules setup"
echo ""
