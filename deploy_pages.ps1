# Build web with peanut
Invoke-Expression "flutter pub global run peanut --extra-args ""--base-href=/sweets_shop/"""

# Push to github pages
Invoke-Expression "git push origin --set-upstream gh-pages"