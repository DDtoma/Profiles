if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

session=${1:-xfce}
case $session in
    i3)
        exec i3;;
    xfce4|xfce)
        exec startxfce4;;
    *)
        exec $1;;
esac

