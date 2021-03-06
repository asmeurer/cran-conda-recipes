#!/bin/sh

_rb_depth=0

rb_try_build() {
    local _name=$1
    local _err=$_name.err
    local _out=$_name.out
    local _cmd="LC_ALL=C conda build $_name"
    local _attempt=0
    local _this_dependency=""
    local _last_dependency=""
    local _failed_package=""
    local _retval=
    local _conda_retval=

    if [ ! -d $_name ]; then
        echo "error: no such directory: $_name" >&2
        return 1
    fi

    _rb_depth=$(($_rb_depth + 1))

    while [ $_rb_depth -lt 50 ]; do
        _attempt=$(($_attempt + 1))
        conda build $_name
        _conda_retval=$?
        if [ $_conda_retval -eq 0 ]; then
            _retval=0
            break
        elif [ $_conda_retval -eq 2 ]; then
            _failed_package=$(cat conda-missing-package.txt)
            rm conda-missing-package.txt
            if ! rb_try_build $_failed_package ; then
                echo failed to build $_failed_package recursively, giving up
                _retval=1
                break
            else
                echo built dependency $_failed_package successfully
                echo re-attempting another build of $_name
                _retval=
                continue
            fi
        else
            echo failed to build package $_name for unknown reasons
            _retval=1
            break
        fi
    done

    _rb_depth=$(($_rb_depth - 1))
    return $_retval
}

if [ -n $1 ]; then
    rb_try_build $1
fi

# vim:set ts=8 sw=4 sts=4 tw=78 et:
