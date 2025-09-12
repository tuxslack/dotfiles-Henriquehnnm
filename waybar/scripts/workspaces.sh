#!/usr/bin/env bash

COUNT=$(qdbus org.kde.KWin /VirtualDesktopManager org.kde.KWin.VirtualDesktopManager.count)
CURRENT=$(qdbus org.kde.KWin /KWin org.kde.KWin.currentDesktop)

TEXT=""
for i in $(seq 1 $COUNT); do
    NUM=""
    if [ "$i" -eq "$CURRENT" ]; then
        NUM="<span foreground='#31748f' weight='bold'>$i</span>"
    else
        NUM="$i"
    fi

    # Adiciona espaços **somente depois do número**, não antes do primeiro
    if [ "$i" -eq 1 ]; then
        TEXT+="$NUM"
    else
        TEXT+="   $NUM"   # 3 espaços entre números
    fi
done

echo "$TEXT"
