#!/bin/sh
set -eu

test -f assets/brand/mugong-smart-sprout.svg
test -f assets/brand/mugong-smart-sprout-512.png
test -f favicon.svg
grep -F '<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" viewBox="0 0 120 120"' assets/brand/mugong-smart-sprout.svg
grep -F '<linearGradient id="mugong-gradient" gradientUnits="userSpaceOnUse" x1="8" y1="8" x2="112" y2="112">' assets/brand/mugong-smart-sprout.svg
grep -F '<stop offset="0%" stop-color="#667eea"' assets/brand/mugong-smart-sprout.svg
grep -F '<stop offset="100%" stop-color="#764ba2"' assets/brand/mugong-smart-sprout.svg
grep -F '<rect x="8" y="8" width="104" height="104" rx="30" fill="url(#mugong-gradient)"' assets/brand/mugong-smart-sprout.svg
grep -F '<path d="M60 84V48 M60 52L38 74 M60 52L82 74" fill="none" stroke="#ffffff" stroke-width="12" stroke-linecap="round" stroke-linejoin="round"' assets/brand/mugong-smart-sprout.svg
grep -F 'cx="60" cy="32" r="8" fill="#bef264" stroke="#ffffff" stroke-width="4"' assets/brand/mugong-smart-sprout.svg
cmp -s assets/brand/mugong-smart-sprout.svg favicon.svg
grep -F 'href="favicon.svg"' index.html
nav=$(sed -n '/<nav/,/<\/nav>/p' index.html)
printf '%s\n' "$nav" | grep -F '<img src="assets/brand/mugong-smart-sprout.svg" alt="木公科技" class="w-10 h-10">'
! printf '%s\n' "$nav" | grep -F '>木</div>'
footer=$(sed -n '/<footer/,/<\/footer>/p' index.html)
printf '%s\n' "$footer" | grep -F '>木</div>'
