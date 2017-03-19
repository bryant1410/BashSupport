while getopts :cdhqv-: opt
do
    [[ - == $opt ]] && opt=${OPTARG%%=*} OPTARG=${OPTARG#*=}
    case $opt in
    c | color ) _color=true ;;
    d | debug ) __enable_debug "$@" ;;
    h | help ) __print_help ; exit 0 ;;
    q | quiet ) _quiet=true ;;
    v | verbose ) _verbose=true ;;
    * ) cat <<EOE >&2 ; exit 3 ;;
${0##*/}: unrecognized option '-$OPTARG'
Try 'cat --help' for more information.
EOE
    esac
done