ROOT=$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")/.." && pwd)
export VSIM_PATH="$ROOT"/sim
source pulp-sdk/setup.sh
source pulp-sdk/sourceme.sh
