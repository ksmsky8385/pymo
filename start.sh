#!/bin/bash

echo -ne "\033]0;pymo\007"

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BASE_CONFIG_FILE="$SCRIPT_DIR/base.env"
CONFIG_FILE="$SCRIPT_DIR/config.env"

if [ -f "$CONFIG_FILE" ]; then
  # shellcheck disable=SC1090
  source "$CONFIG_FILE"
else
  PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
fi

if [ -z "${PROJECT_ROOT:-}" ]; then
	PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
fi

if [ -z "${MODULE_DIR_NAME:-}" ]; then
	MODULE_DIR_NAME="python_module_"
fi


REGISTERED_MODULES=("00" "01" "02" "03" "04" "05" "06" "07" "08" "09" "10")

# ==============================
# 출력 색상 / 태그 설정
# ==============================

printf -v PY_BLUE '\033[1;38;5;33m'
printf -v PY_YELLOW '\033[1;38;5;220m'
printf -v BOLD '\033[1m'
printf -v RESET '\033[0m'
printf -v RED '\033[1;31m'
printf -v GREEN '\033[1;32m'
printf -v YELLOW '\033[1;33m'
printf -v BLUE '\033[1;34m'
printf -v CYAN '\033[1;36m'
printf -v RESET '\033[0m'

TAG_RUN="${PY_YELLOW}[RUN]${RESET}"
TAG_INFO="${CYAN}[INFO]${RESET}"
TAG_DONE="${GREEN}[DONE]${RESET}"
TAG_WARN="${YELLOW}[WARN]${RESET}"
TAG_ERROR="${RED}[ERROR]${RESET}"
TAG_SKIP="${BLUE}[SKIP]${RESET}"
TAG_CHECK="${CYAN}[CHECK]${RESET}"
TAG_CREATE="${GREEN}[CREATE]${RESET}"
TAG_PART="${BLUE}[PART]${RESET}"
TAG_TEST="${PY_BLUE}[TEST]${RESET}"
TAG_STOP="${RED}[STOP]${RESET}"

# ==============================
# 명칭 설정
# ==============================

TITLE_MAIN="${PY_BLUE}42 Python Module Helper${RESET}"
TITLE_SUB="${PY_YELLOW}- Made By <seunkang>${RESET}"

MODULE_00_NAME="Growing Code"
MODULE_01_NAME="Code Cultivation"
MODULE_02_NAME="Garden Guardian"
MODULE_03_NAME="Data Quest"
MODULE_04_NAME="Data Archivist"
MODULE_05_NAME="Code Nexus"
MODULE_06_NAME="The Codex"
MODULE_07_NAME="DataDeck"
MODULE_08_NAME="The Matrix"
MODULE_09_NAME="Cosmic Data"
MODULE_10_NAME="FuncMage"

# ==============================
# 파일 생성 목록
# ==============================

MODULE_00_FILES=(
  "ex0/ft_hello_garden.py"
  "ex1/ft_garden_name.py"
  "ex2/ft_plot_area.py"
  "ex3/ft_harvest_total.py"
  "ex4/ft_plant_age.py"
  "ex5/ft_water_reminder.py"
  "ex6/ft_count_harvest_iterative.py"
  "ex6/ft_count_harvest_recursive.py"
  "ex7/ft_seed_inventory.py"
)

MODULE_01_FILES=(
  "ex0/ft_garden_intro.py"
  "ex1/ft_garden_data.py"
  "ex2/ft_plant_growth.py"
  "ex3/ft_plant_factory.py"
  "ex4/ft_garden_security.py"
  "ex5/ft_plant_types.py"
  "ex6/ft_garden_analytics.py"
)

MODULE_02_FILES=(
  "ex0/ft_first_exception.py"
  "ex1/ft_raise_exception.py"
  "ex2/ft_different_errors.py"
  "ex3/ft_custom_errors.py"
  "ex4/ft_finally_block.py"
)

MODULE_03_FILES=(
  "ex0/ft_command_quest.py"
  "ex1/ft_score_analytics.py"
  "ex2/ft_coordinate_system.py"
  "ex3/ft_achievement_tracker.py"
  "ex4/ft_inventory_system.py"
  "ex5/ft_data_stream.py"
  "ex6/ft_data_alchemist.py"
)

MODULE_04_FILES=(
  "ex0/ft_ancient_text.py"
  "ex1/ft_archive_creation.py"
  "ex2/ft_stream_management.py"
  "ex3/ft_vault_security.py"
)

MODULE_05_FILES=(
  "ex0/data_processor.py"
  "ex1/data_stream.py"
  "ex2/data_pipeline.py"
)

MODULE_06_FILES=(
  "alchemy/__init__.py"
  "alchemy/elements.py"
  "alchemy/grimoire/__init__.py"
  "alchemy/grimoire/dark_spellbook.py"
  "alchemy/grimoire/dark_validator.py"
  "alchemy/grimoire/light_spellbook.py"
  "alchemy/grimoire/light_validator.py"
  "alchemy/potions.py"
  "alchemy/transmutation/__init__.py"
  "alchemy/transmutation/recipes.py"
  "elements.py"
  "ft_alembic_0.py"
  "ft_alembic_1.py"
  "ft_alembic_2.py"
  "ft_alembic_3.py"
  "ft_alembic_4.py"
  "ft_alembic_5.py"
  "ft_distillation_0.py"
  "ft_distillation_1.py"
  "ft_kaboom_0.py"
  "ft_kaboom_1.py"
  "ft_transmutation_0.py"
  "ft_transmutation_1.py"
  "ft_transmutation_2.py"
)

MODULE_07_FILES=(
  "battle.py"
  "capacitor.py"
  "tournament.py"
  "ex0/__init__.py"
  "ex1/__init__.py"
  "ex2/__init__.py"
)

MODULE_08_FILES=(
  "ex0/construct.py"
  "ex1/loading.py"
  "ex1/requirements.txt"
  "ex1/pyproject.toml"
  "ex2/oracle.py"
  "ex2/.env.example"
  "ex2/.gitignore"
)

MODULE_09_FILES=(
  "ex0/space_station.py"
  "ex1/alien_contact.py"
  "ex2/space_crew.py"
)

MODULE_10_FILES=(
  "ex0/lambda_spells.py"
  "ex1/higher_magic.py"
  "ex2/scope_mysteries.py"
  "ex3/functools_artifacts.py"
  "ex4/decorator_mastery.py"
)

# ==============================
# 모듈별 테스트 함수 지정
# ==============================

MODULE_00_TESTER="run_module_00_tests"
MODULE_01_TESTER="run_generic_module_tests"
MODULE_02_TESTER="run_generic_module_tests"
MODULE_03_TESTER="run_module_03_tests"
MODULE_04_TESTER="run_module_04_tests"
MODULE_05_TESTER="run_generic_module_tests"
MODULE_06_TESTER="run_module_06_tests"
MODULE_07_TESTER="run_module_07_tests"
MODULE_08_TESTER="run_module_08_tests"
MODULE_09_TESTER="run_module_09_tests"
MODULE_10_TESTER="run_module_10_tests"


# ==============================
# 모듈별 테스트 산출물 삭제 대상
# ==============================

MODULE_04_CLEANUP_PATTERNS=("new_fragment")
MODULE_08_CLEANUP_PATTERNS=("png")
MODULE_09_CLEANUP_PATTERNS=("generated_data")

# ==============================
# 공통 유틸
# ==============================

print_line() {
  printf '%s\n' "-----------------------------------------------------"
}

pause() {
  printf '\n엔터를 누르면 계속합니다...'
  read -r _
}

module_dir() {
  printf '%s/%s%s' "$PROJECT_ROOT" "$MODULE_DIR_NAME" "$1"
}

is_registered_module() {
  local module="$1"
  local m

  for m in "${REGISTERED_MODULES[@]}"; do
    [ "$m" = "$module" ] && return 0
  done
  return 1
}

get_module_files_var() {
  printf 'MODULE_%s_FILES' "$1"
}

get_module_files() {
  local var_name

  var_name="$(get_module_files_var "$1")"
  eval 'printf "%s\n" "${'"$var_name"'[@]}"'
}

get_module_tester_var() {
  printf 'MODULE_%s_TESTER' "$1"
}

get_module_tester() {
  local var_name

  var_name="$(get_module_tester_var "$1")"
  eval 'printf "%s" "${'"$var_name"':-}"'
}

remove_pycache() {
  local base_dir="$1"

  [ -d "$base_dir" ] && find "$base_dir" -type d -name '__pycache__' -prune -exec rm -rf {} +
}

remove_mypy_cache() {
  local base_dir="$1"

  [ -d "$base_dir" ] && find "$base_dir" -type d -name '.mypy_cache' -prune -exec rm -rf {} +
}

# ==============================
# 디렉토리/파일 생성
# ==============================

create_module_structure() {
  local module="$1"
  local dir
  local item
  local file_path

  if ! is_registered_module "$module"; then
    printf "\n${TAG_ERROR} 등록되지 않은 module 번호입니다: %s\n" "$module"
    return 1
  fi

  dir="$(module_dir "$module")"
  mkdir -p "$dir"

  while IFS= read -r item; do
    [ -z "$item" ] && continue

    file_path="$dir/$item"
    mkdir -p "$(dirname "$file_path")"

    if [ ! -e "$file_path" ]; then
      touch "$file_path"
      chmod +x "$file_path"
      printf "\n${TAG_CREATE} %s\n" "$file_path"
    else
      printf "\n${TAG_SKIP} 이미 존재함: %s\n" "$file_path"
    fi
  done < <(get_module_files "$module")

  printf "\n${TAG_DONE} python module %s 생성 완료\n" "$module"
}

select_create_modules() {
  local input
  local module

  print_line
  printf "생성할 module 번호를 입력하세요. (번호 또는 all)\n\n"
  print_registered_modules_with_status "create"
  printf '\n> '
  read -r input

  if [ "$input" = "all" ] || [ "$input" = "ALL" ]; then
    for module in "${REGISTERED_MODULES[@]}"; do
      create_module_structure "$module"
    done
  else
    if [[ "$input" =~ ^[0-9]$ ]]; then
      input="0$input"
    fi

    create_module_structure "$input"
  fi
}

get_module_status() {
  local module="$1"
  local base_dir
  local item
  local file_path
  local has_empty=0

  base_dir="$(module_dir "$module")"

  if [ ! -d "$base_dir" ]; then
    printf 'missing'
    return 0
  fi

  while IFS= read -r item; do
    [ -z "$item" ] && continue
    file_path="$base_dir/$item"

    if [ ! -e "$file_path" ]; then
      printf 'missing'
      return 0
    fi

		if [ -f "$file_path" ] && [ ! -s "$file_path" ]; then
			if [ "$(basename "$file_path")" != "__init__.py" ]; then
				has_empty=1
			fi
		fi
  done < <(get_module_files "$module")

  if [ "$has_empty" -eq 1 ]; then
    printf 'empty'
  else
    printf 'complete'
  fi
}

print_registered_modules_with_status() {
  local mode="$1"
  local module
  local name
  local status

  for module in "${REGISTERED_MODULES[@]}"; do
    name="$(get_module_name "$module")"
    status="$(get_module_status "$module")"

    case "$mode:$status" in
      create:empty|create:complete)
        printf '%s. "%s" %b\n' "$module" "$name" "${GREEN}- Created${RESET}"
        ;;
      test:missing)
        printf '%b. "%s"\n' "${RED}${module}${RESET}" "$name"
        ;;
      test:empty)
        printf '%b. "%s"\n' "${YELLOW}${module}${RESET}" "$name"
        ;;
      test:complete)
        printf '%b. "%s"\n' "${GREEN}${module}${RESET}" "$name"
        ;;
      *)
        printf '%s. "%s"\n' "$module" "$name"
        ;;
    esac
  done
}

# ==============================
# 테스트 메뉴
# ==============================

run_tests_for_module_at_dir() {
  local module="$1"
  local base_dir="$2"

  if ! is_registered_module "$module"; then
    printf "\n${TAG_ERROR} 등록되지 않은 module 번호입니다: %s\n" "$module"
    return 1
  fi

  if [ ! -d "$base_dir" ]; then
    printf "\n${TAG_ERROR} 과제 폴더가 없습니다: %s\n" "$base_dir"
    return 1
  fi

  if ! run_static_checks "$base_dir"; then
    remove_mypy_cache "$base_dir"
    remove_pycache "$base_dir"

    if ! handle_static_check_error; then
      return 1
    fi
  fi

  if ! run_module_test_by_mapping "$module" "$base_dir"; then
    remove_mypy_cache "$base_dir"
    remove_pycache "$base_dir"
    printf "\n${TAG_WARN} 실행 테스트 중 실패가 감지되었습니다: python module %s\n" "$module"
    return 1
  fi

  remove_mypy_cache "$base_dir"
  remove_pycache "$base_dir"
  printf "\n${TAG_DONE} 테스트 종료 및 캐시 정리 완료: python module %s\n" "$module"
}

run_tests_for_module() {
  local module="$1"

  run_tests_for_module_at_dir "$module" "$(module_dir "$module")"
}

run_eval_mode() {
  local eval_root
  local dir
  local module
  local choice
  local index
  local selected_dir
  local selected_module
  local -a detected_dirs=()
  local -a detected_modules=()

  printf '\neval mode : 경로를 입력하세요.\n\n> '
  read -e -r eval_root

  if [ ! -d "$eval_root" ]; then
    printf "\n${TAG_ERROR} 존재하지 않는 경로입니다: %s\n" "$eval_root"
    return 1
  fi

  eval_root="$(cd "$eval_root" && pwd)"

  while IFS= read -r -d '' dir; do
    for module in "${REGISTERED_MODULES[@]}"; do
      if looks_like_module_dir "$module" "$dir"; then
        detected_dirs+=("$dir")
        detected_modules+=("$module")
      fi
    done
  done < <(find "$eval_root" -mindepth 1 -maxdepth 1 -type d -print0)

  if [ "${#detected_dirs[@]}" -eq 0 ]; then
    printf "\n${TAG_INFO} 모듈 과제 폴더를 찾지 못했습니다: %s\n" "$eval_root"
    return 1
  fi

  printf "\n${TAG_INFO} 감지된 모듈 과제 폴더:\n\n"
  for ((index = 0; index < ${#detected_dirs[@]}; index++)); do
    printf '%d. %s - module %s\n' \
      "$((index + 1))" "$(basename "${detected_dirs[$index]}")" \
      "${detected_modules[$index]}"
  done

  printf '\n테스트할 항목 번호를 입력하세요.\n> '
  read -r choice

  if ! [[ "$choice" =~ ^[0-9]+$ ]] ||
     [ "$choice" -lt 1 ] || [ "$choice" -gt "${#detected_dirs[@]}" ]; then
    printf "\n${TAG_ERROR} 잘못된 항목 번호입니다: %s\n" "$choice"
    return 1
  fi

  index=$((choice - 1))
  selected_dir="${detected_dirs[$index]}"
  selected_module="${detected_modules[$index]}"

  printf "\n${TAG_INFO} 평가 경로: %s (module %s)\n" \
    "$selected_dir" "$selected_module"

  (
    cd "$selected_dir" || exit 1
    run_tests_for_module_at_dir "$selected_module" "$PWD"
  )
}

select_test_module() {
  local module

  print_line
  printf '테스트할 module 번호 또는 eval을 입력하세요.\n\n'
  printf '(eval = 지정 경로에서 모듈 과제 폴더 검색 및 테스트)\n\n'
  print_registered_modules_with_status "test"
  printf '\n> '
  read -r module

  if [ "$module" = "eval" ] || [ "$module" = "EVAL" ]; then
    run_eval_mode
    return $?
  fi

  if [[ "$module" =~ ^[0-9]$ ]]; then
    module="0$module"
  fi

  run_tests_for_module "$module"
}

# ==============================
# 정적 검사
# ==============================

ensure_local_bin_in_bashrc() {
  local bashrc="$HOME/.bashrc"
  local path_line='export PATH="$HOME/.local/bin:$PATH"'

  if [ ! -f "$bashrc" ]; then
    touch "$bashrc"
  fi

  if ! grep -Fxq "$path_line" "$bashrc"; then
    printf '\n%s\n' "$path_line" >> "$bashrc"
    printf "\n${TAG_DONE} 환경변수 등록 완료: %s\n" "$bashrc"
  else
    printf "\n${TAG_INFO} 환경변수가 이미 등록되어 있습니다.\n"
  fi
}

ensure_tool_or_choose() {
  local tool="$1"
  local package="$2"
  local answer
  local local_tool="$HOME/.local/bin/$tool"

  if "$tool" --version >/dev/null 2>&1; then
    return 0
  fi

  if [ -x "$local_tool" ] && "$local_tool" --version >/dev/null 2>&1; then
    export PATH="$HOME/.local/bin:$PATH"
    return 0
  fi

  printf "\n${TAG_WARN} %s 가 설치되어 있지 않습니다.\n" "$tool"
  printf '1. pip install --user %s 로 설치 후 다시 검사\n' "$package"
  printf '2. %s 검사를 무시하고 계속\n' "$tool"
  printf '3. 종료\n'
  printf '> '
  read -r answer

  case "$answer" in
    1)
      python3 -m pip install --user "$package"
      ensure_local_bin_in_bashrc
      export PATH="$HOME/.local/bin:$PATH"

      if "$tool" --version >/dev/null 2>&1; then
        return 0
      fi

      if python3 -m "$package" --version >/dev/null 2>&1; then
        return 2
      fi

      printf "\n${TAG_ERROR} 설치 후에도 %s 실행을 확인하지 못했습니다.\n" "$tool"
      return 1
      ;;
    2)
      return 3
      ;;
    *)
      return 1
      ;;
  esac
}

run_flake8() {
  local base_dir="$1"
  local status
  local result

  ensure_tool_or_choose "flake8" "flake8"
  status=$?

  case "$status" in
    0)
      (cd "$base_dir" || exit 1; flake8 . --extend-exclude='*env,data_generator,generated_data')
      result=$?
      ;;
    2)
      (cd "$base_dir" || exit 1; python3 -m flake8 . --extend-exclude='*env,data_generator,generated_data')
      result=$?
      ;;
    3)
      printf "\n${TAG_SKIP} flake8 검사를 건너뜁니다.\n"
      return 0
      ;;
    *)
      return 1
      ;;
  esac

  if [ "$result" -eq 0 ]; then
    printf "${GREEN}Success: no issues found in all source files${RESET}\n"
  fi

  return "$result"
}

run_mypy_command() {
  local mode="$1"
  local files=()

  mapfile -d '' files < <(
    find . \
      -type d \( \
        -name '*env' -o \
        -name 'data_generator' -o \
        -name 'generated_data' \
      \) -prune -o \
      -type f -name '*.py' ! -path './main.py' -print0
  )

  if [ "${#files[@]}" -eq 0 ]; then
    printf "\n${TAG_SKIP} mypy 검사 대상 .py 파일이 없습니다.\n"
    return 0
  fi

  if [ "$mode" = "module" ]; then
    python3 -m mypy --strict "${files[@]}"
  else
    mypy --strict "${files[@]}"
  fi
}

run_mypy() {
  local base_dir="$1"
  local status
  local result

  ensure_tool_or_choose "mypy" "mypy"
  status=$?

  case "$status" in
    0)
      (cd "$base_dir" || exit 1; run_mypy_command "bin")
      result=$?
      ;;
    2)
      (cd "$base_dir" || exit 1; run_mypy_command "module")
      result=$?
      ;;
    3)
      printf "\n${TAG_SKIP} mypy 검사를 건너뜁니다.\n"
      return 0
      ;;
    *)
      return 1
      ;;
  esac

  remove_mypy_cache "$base_dir"
  return "$result"
}

run_static_checks() {
  local base_dir="$1"

  printf "\n${TAG_CHECK} flake8 실행\n"
  if ! run_flake8 "$base_dir"; then
    return 1
  fi

  printf "\n${TAG_CHECK} mypy --strict 실행\n"
  if ! run_mypy "$base_dir"; then
    return 1
  fi

  remove_mypy_cache "$base_dir"
  return 0
}

handle_static_check_error() {
  local answer

  printf "\n${TAG_WARN} 정적 검사 에러가 감지되었습니다.\n"
  printf '1. 초기화면으로 돌아가기\n'
  printf '2. 무시하고 실행 테스트 계속하기\n'
  printf '3. 종료\n'
  printf '> '
  read -r answer

  case "$answer" in
    1)
      return 1
      ;;
    2)
      return 0
      ;;
    3)
      exit 0
      ;;
    *)
      printf "\n${TAG_ERROR} 잘못된 입력입니다. 초기화면으로 돌아갑니다.\n"
      return 1
      ;;
  esac
}

# ==============================
# 테스트 실행 함수 모음
# ==============================

should_skip_empty_file() {
  local file_path="$1"

  if [ ! -s "$file_path" ]; then
    printf "\n${TAG_SKIP} 빈 파일: %s\n" "$file_path"
    return 0
  fi

  return 1
}

run_entry_file() {
  local run_dir="$1"
  local file_name="$2"
  local short_dir

  short_dir="$(basename "$run_dir")"

  if [ ! -f "$run_dir/$file_name" ]; then
    printf "\n${TAG_WARN} 진입점 파일 없음: %s/%s\n" "$run_dir" "$file_name"
    return 1
  fi

  if should_skip_empty_file "$run_dir/$file_name"; then
    return 0
  fi

  printf "\n${TAG_RUN} ${YELLOW}%s${RESET} - python3 %s\n" "$short_dir" "$file_name"
  (cd "$run_dir" || exit 1; python3 "$file_name")
}

run_entry_file_with_args() {
  local run_dir="$1"
  local file_name="$2"
  local short_dir
  shift 2

  short_dir="$(basename "$run_dir")"

  if [ ! -f "$run_dir/$file_name" ]; then
    printf "\n${TAG_WARN} 진입점 파일 없음: %s/%s\n" "$run_dir" "$file_name"
    return 1
  fi

  if should_skip_empty_file "$run_dir/$file_name"; then
    return 0
  fi

  printf "\n${TAG_RUN} ${YELLOW}%s${RESET} - python3 %s" "$short_dir" "$file_name"
  if [ "$#" -gt 0 ]; then
    printf " %q" "$@"
  fi
  printf '\n'

  (cd "$run_dir" || exit 1; python3 "$file_name" "$@")
}

get_module_cleanup_patterns_var() {
  printf 'MODULE_%s_CLEANUP_PATTERNS' "$1"
}

get_module_cleanup_patterns() {
  local var_name

  var_name="$(get_module_cleanup_patterns_var "$1")"
  eval 'printf "%s\n" "${'"$var_name"'[@]:-}"'
}

ask_remove_generated_files() {
  local module="$1"
  local target_dir="$2"
  local answer
  local patterns
  local found_items=""

  patterns="$(get_module_cleanup_patterns "$module")"

  if [ -z "$patterns" ]; then
    return 0
  fi

  while IFS= read -r pattern; do
    [ -z "$pattern" ] && continue

    found_items="$(
      {
        printf '%s\n' "$found_items"
        find "$target_dir" -mindepth 1 \( -type f -o -type d \) -name "*$pattern*" -print
      } | sed '/^$/d' | sort -u
    )"
  done <<< "$patterns"

  if [ -z "$found_items" ]; then
    return 0
  fi

  printf "\n${TAG_WARN} module %s 테스트 산출물이 감지되었습니다.\n\n" "$module"
  printf '%s\n' "$found_items"
  printf '\n디렉토리 정리를 위해 삭제하겠습니까? [Y/n] '
  read -r answer

  case "$answer" in
    n|N|no|NO)
      printf "\n${TAG_SKIP} 생성 파일/디렉토리 삭제를 건너뜁니다.\n"
      ;;
    *)
      while IFS= read -r item; do
        [ -e "$item" ] && rm -rf "$item"
      done <<< "$found_items"

      printf "\n${TAG_DONE} 생성 파일/디렉토리 삭제 완료\n"
      ;;
  esac
}

append_pyenv_config() {
  local rc_file="$1"
  local init_shell="$2"
  local line
  local lines=(
    'export PYENV_ROOT="$HOME/.pyenv"'
    '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"'
    "eval \"\$(pyenv init - $init_shell)\""
  )

  [ -f "$rc_file" ] || touch "$rc_file"

  for line in "${lines[@]}"; do
    if ! grep -Fxq "$line" "$rc_file"; then
      printf '\n%s\n' "$line" >> "$rc_file"
    fi
  done

  printf "\n${TAG_DONE} pyenv 환경설정 등록 완료: %s\n" "$rc_file"
}

install_pyenv_for_user() {
  local login_shell

  if ! command -v git >/dev/null 2>&1; then
    printf "\n${TAG_ERROR} pyenv 설치에 필요한 git 명령어가 없습니다.\n"
    return 1
  fi

  if [ ! -x "$HOME/.pyenv/bin/pyenv" ]; then
    if [ -e "$HOME/.pyenv" ]; then
      printf "\n${TAG_ERROR} %s 경로가 이미 존재하지만 정상적인 pyenv 설치가 아닙니다.\n" "$HOME/.pyenv"
      return 1
    fi

    printf "\n${TAG_INFO} 사용자 로컬 경로에 pyenv를 설치합니다: %s\n" "$HOME/.pyenv"
    git clone https://github.com/pyenv/pyenv.git "$HOME/.pyenv" || return 1
  fi

  login_shell="$(basename "${SHELL:-bash}")"

  case "$login_shell" in
    zsh)
      append_pyenv_config "$HOME/.zshrc" "zsh" || return 1
      ;;
    bash)
      append_pyenv_config "$HOME/.bashrc" "bash" || return 1
      append_pyenv_config "$HOME/.profile" "bash" || return 1
      ;;
    *)
      printf "\n${TAG_WARN} %s 셸의 자동 환경설정은 지원하지 않습니다. 현재 테스트에서만 pyenv를 사용합니다.\n" "$login_shell"
      ;;
  esac

  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - bash)"

  if ! pyenv --version >/dev/null 2>&1; then
    printf "\n${TAG_ERROR} 설치 후에도 pyenv 실행을 확인하지 못했습니다.\n"
    return 1
  fi

  printf "\n${TAG_DONE} pyenv 사용자 로컬 설치 완료\n"
}

ensure_python_310_for_module() {
  local base_dir="$1"
  local answer
  local pyenv_310

  if python --version 2>&1 | grep -q '^Python 3\.10\.'; then
    return 0
  fi

  printf "\n${TAG_WARN} 현재 python 버전이 3.10대가 아닙니다.\n"

  if ! pyenv --version >/dev/null 2>&1; then
    printf "\n${TAG_WARN} pyenv가 설치되어 있지 않습니다.\n"
    printf '1. ~/.pyenv에 사용자 로컬 설치 후 계속\n'
    printf '2. 무시하고 계속\n'
    printf '3. 종료\n'
    printf '> '
    read -r answer

    case "$answer" in
      1)
        install_pyenv_for_user || return 1
        ;;
      2)
        return 0
        ;;
      *)
        return 1
        ;;
    esac
  fi

  pyenv_310="$(pyenv versions --bare | grep '^3\.10\.' | head -n 1)"

  if [ -z "$pyenv_310" ]; then
    printf "\n${TAG_WARN} pyenv에 Python 3.10대 버전이 없습니다.\n"
    printf '1. pyenv install 3.10.13 후 다시 검사\n'
    printf '2. Python 3.10 검사를 무시하고 계속\n'
    printf '3. 종료\n'
    printf '> '
    read -r answer

    case "$answer" in
      1)
        pyenv install 3.10.13 || return 1
        pyenv_310="3.10.13"
        ;;
      2)
        return 0
        ;;
      *)
        return 1
        ;;
    esac
  fi

  (
    cd "$base_dir" || exit 1
    pyenv local "$pyenv_310"
  ) || return 1

  printf "\n${TAG_DONE} module 08 Python 버전 설정 완료: %s\n" "$pyenv_310"
}

ensure_module_venv() {
  local base_dir="$1"
  local venv_dir

  venv_dir="$(find "$base_dir" -mindepth 1 -maxdepth 1 -type d -name '*env' | head -n 1)"

  if [ -n "$venv_dir" ]; then
    basename "$venv_dir"
    return 0
  fi

  printf "\n${TAG_INFO} 가상환경이 없어 matrix_env를 생성합니다.\n" >&2
  (
    cd "$base_dir" || exit 1
    python3 -m venv matrix_env
  ) || return 1

  printf 'matrix_env\n'
}

run_module_test_by_mapping() {
  local module="$1"
  local base_dir="$2"
  local tester

  tester="$(get_module_tester "$module")"

  if [ -z "$tester" ]; then
    printf "\n${TAG_WARN} module %s 테스터 로직이 업데이트 되어있지 않습니다.\n" "$module"
    return 1
  fi

  if ! declare -F "$tester" >/dev/null 2>&1; then
    printf "\n${TAG_ERROR} 테스트 함수가 존재하지 않습니다: %s\n" "$tester"
    return 1
  fi

  "$tester" "$module" "$base_dir"
}

run_generic_module_tests() {
  local module="$1"
  local base_dir="$2"

  run_generic_ex_file_tests "$module" "$base_dir"
}

run_generic_ex_file_tests() {
  local module="$1"
  local base_dir="$2"
  local item
  local file_path
  local run_dir
  local file_name
  local result=0

  printf "\n${TAG_TEST} python module %s 실행 테스트\n" "$module"

  while IFS= read -r item; do
    [ -z "$item" ] && continue

    file_path="$base_dir/$item"

    if [ ! -f "$file_path" ]; then
      printf "\n${TAG_WARN} 파일 없음: %s\n" "$file_path"
      result=1
      continue
    fi

    if should_skip_empty_file "$file_path"; then
      continue
    fi

    run_dir="$(dirname "$file_path")"
    file_name="$(basename "$file_path")"

    printf "\n${TAG_RUN} ${YELLOW}%s${RESET} - python3 %s\n" "$(dirname "$item")" "$file_name"

    if ! (cd "$run_dir" || exit 1; python3 "$file_name"); then
      result=1
    fi
  done < <(get_module_files "$module")

  return "$result"
}

run_module_00_tests() {
  local _module="$1"
  local base_dir="$2"
  local helper_main="$SCRIPT_DIR/resource/module_00/main.py"
  local result=0

  printf "\n${TAG_TEST} python module 00 실행 테스트\n"

  if [ ! -f "$helper_main" ]; then
    printf "\n${TAG_ERROR} helper main.py가 없습니다: %s\n" "$helper_main"
    return 1
  fi

  if should_skip_empty_file "$helper_main"; then
    return 0
  fi

  cp "$helper_main" "$base_dir/main.py"

  printf "\n${TAG_RUN} python3 main.py\n\n"
  (
    cd "$base_dir" || exit 1
    python3 main.py
  ) || result=1

  rm -f "$base_dir/main.py"

  return "$result"
}

run_module_03_tests() {
  local _module="$1"
  local base_dir="$2"
  local result=0

  printf "\n${TAG_TEST} python module 03 실행 테스트\n"

  run_entry_file_with_args "$base_dir/ex0" "ft_command_quest.py" || result=1
  run_entry_file_with_args "$base_dir/ex0" "ft_command_quest.py" hello world 42 || result=1
  run_entry_file_with_args "$base_dir/ex0" "ft_command_quest.py" "Data Quest" || result=1

  run_entry_file_with_args "$base_dir/ex1" "ft_score_analytics.py" 1500 2300 1800 2100 1950 || result=1
  run_entry_file_with_args "$base_dir/ex1" "ft_score_analytics.py" || result=1
  run_entry_file_with_args "$base_dir/ex1" "ft_score_analytics.py" ab ac || result=1

  if ! should_skip_empty_file "$base_dir/ex2/ft_coordinate_system.py"; then
    printf "\n${TAG_RUN} ${YELLOW}ex2${RESET} - python3 ft_coordinate_system.py\n"
    printf "\n${TAG_INFO} input pipe:\n\n"
    printf "       1) hello world\n"
    printf "       2) 1.0 , 2.5, 3.0\n"
    printf "       3) 4,abc,5\n"
    printf "       4) 4,5,6\n\n"
    (
      cd "$base_dir/ex2" || exit 1
      printf 'hello world\n1.0 , 2.5, 3.0\n4,abc,5\n4,5,6\n' \
        | python3 ft_coordinate_system.py \
        | sed "s/format 'x,y,z': /format 'x,y,z':\n/g"
    ) || result=1
  fi

  run_entry_file_with_args "$base_dir/ex3" "ft_achievement_tracker.py" || result=1

  run_entry_file_with_args "$base_dir/ex4" "ft_inventory_system.py" \
    sword:1 potion:5 shield:2 armor:3 helmet:1 sword:2 hello key:value || result=1

  run_entry_file_with_args "$base_dir/ex5" "ft_data_stream.py" || result=1
  run_entry_file_with_args "$base_dir/ex6" "ft_data_alchemist.py" || result=1

  return "$result"
}

run_module_04_tests() {
  local _module="$1"
  local base_dir="$2"
  local resource_dir="$SCRIPT_DIR/resource/module_04"
  local sample_src="$resource_dir/ancient_fragment.txt"
  local sample_name="ancient_fragment.txt"
  local sample_dst="$base_dir/ex0/$sample_name"
  local etc_src="$resource_dir/etc"
  local result=0

  printf "\n${TAG_TEST} python module 04 실행 테스트\n"

  if [ ! -f "$sample_src" ]; then
    printf "\n${TAG_ERROR} module 04 테스트 리소스 파일이 없습니다: %s\n" "$sample_src"
    return 1
  fi

  if ! should_skip_empty_file "$base_dir/ex0/ft_ancient_text.py"; then
    cp "$sample_src" "$sample_dst"

    if [ -f "$etc_src/master.passwd" ]; then
      rm -rf "$base_dir/ex0/etc"
      mkdir -p "$base_dir/ex0/etc"
      cp "$etc_src/master.passwd" "$base_dir/ex0/etc/master.passwd"
      chmod 000 "$base_dir/ex0/etc/master.passwd" 2>/dev/null || true
    else
      printf "\n${TAG_WARN} module 04 권한 테스트 리소스가 없습니다: %s/master.passwd\n" "$etc_src"
    fi

    printf "\n${TAG_INFO} cat ancient_fragment.txt\n"
    (
      cd "$base_dir/ex0" || exit 1
      cat "$sample_name"
    ) || result=1

    run_entry_file_with_args "$base_dir/ex0" "ft_ancient_text.py" || result=1
    run_entry_file_with_args "$base_dir/ex0" "ft_ancient_text.py" "foo" || result=1
    run_entry_file_with_args "$base_dir/ex0" "ft_ancient_text.py" "etc/master.passwd" || result=1
    run_entry_file_with_args "$base_dir/ex0" "ft_ancient_text.py" "$sample_name" || result=1

    rm -f "$sample_dst"
    chmod -R u+rwx "$base_dir/ex0/etc" 2>/dev/null || true
    rm -rf "$base_dir/ex0/etc"
  fi

  if ! should_skip_empty_file "$base_dir/ex1/ft_archive_creation.py"; then
    printf "\n${TAG_RUN} ${YELLOW}ex1${RESET} - python3 ft_archive_creation.py ancient_fragment.txt\n"
    printf "\n${TAG_INFO} input : \"\"\n\n"

    (
      cd "$base_dir/ex1" || exit 1
      cp "$sample_src" "$sample_name"

      printf '\n' \
        | python3 ft_archive_creation.py "$sample_name" \
        | awk '{ gsub("Enter new file name \\(or empty\\): ", "Enter new file name (or empty):\n"); print }'

      rm -f "$sample_name"
    ) || result=1

    printf "\n${TAG_RUN} ${YELLOW}ex1${RESET} - python3 ft_archive_creation.py ancient_fragment.txt\n"
    printf "\n${TAG_INFO} input : "new_fragment.txt"\n\n"

    (
      cd "$base_dir/ex1" || exit 1
      cp "$sample_src" "$sample_name"

      printf 'new_fragment.txt\n' \
        | python3 ft_archive_creation.py "$sample_name" \
        | awk '{ gsub("Enter new file name \\(or empty\\): ", "Enter new file name (or empty):\n"); print }'

      printf "\n${TAG_INFO} cat new_fragment.txt\n"
      cat new_fragment.txt
      printf '\n'

      rm -f "$sample_name"
    ) || result=1
  fi

  run_entry_file_with_args "$base_dir/ex2" "ft_stream_management.py" "foo" || result=1

  if ! should_skip_empty_file "$base_dir/ex2/ft_stream_management.py"; then
    printf "\n${TAG_RUN} ${YELLOW}ex2${RESET} - python3 ft_stream_management.py ancient_fragment.txt\n"
    (
      cd "$base_dir/ex2" || exit 1
      cp "$sample_src" "$sample_name"

      printf '/etc/passwd\n' \
        | python3 -u ft_stream_management.py "$sample_name" 2>&1 \
        | awk '{ gsub("Enter new file name \\(or empty\\): ", "Enter new file name (or empty):\n"); print }'

      rm -f "$sample_name"
    ) || result=1
  fi

  if ! should_skip_empty_file "$base_dir/ex3/ft_vault_security.py"; then
    (
      cd "$base_dir/ex3" || exit 1

      cp "$sample_src" "$sample_name"

      mkdir -p etc

      if [ -f "$etc_src/master.passwd" ]; then
        cp "$etc_src/master.passwd" etc/master.passwd
        chmod 000 etc/master.passwd 2>/dev/null || true
      else
        printf "\n${TAG_WARN} module 04 권한 테스트 리소스가 없습니다: %s/master.passwd\n" "$etc_src"
      fi
    ) || result=1

    run_entry_file_with_args "$base_dir/ex3" "ft_vault_security.py" || result=1

    chmod -R u+rwx "$base_dir/ex3/etc" 2>/dev/null || true
    rm -rf "$base_dir/ex3/etc"
    rm -f "$base_dir/ex3/$sample_name"
  fi

  ask_remove_generated_files "$_module" "$base_dir"

  return "$result"
}

run_module_06_tests() {
  local _module="$1"
  local base_dir="$2"
  local result=0

  printf "\n${TAG_TEST} python module 06 실행 테스트\n"
  
  printf "\n${TAG_PART} I: The Alembic\n"

  run_entry_file "$base_dir" "ft_alembic_0.py" || result=1
  run_entry_file "$base_dir" "ft_alembic_1.py" || result=1
  run_entry_file "$base_dir" "ft_alembic_2.py" || result=1
  run_entry_file "$base_dir" "ft_alembic_3.py" || result=1

	if ! should_skip_empty_file "$base_dir/ft_alembic_4.py"; then
		printf "\n${TAG_INFO} ft_alembic_4.py는 의도된 예외가 발생됩니다.\n"

		if ! run_entry_file "$base_dir" "ft_alembic_4.py"; then
			printf "\n${TAG_INFO} ft_alembic_4.py 예외 발생 확인\n"
		else
			printf "\n${TAG_WARN} ft_alembic_4.py는 예외가 발생해야 합니다.\n"
		fi
	fi

  run_entry_file "$base_dir" "ft_alembic_5.py" || result=1
  
  printf "\n${TAG_PART} II: Distillation\n"
  
  run_entry_file "$base_dir" "ft_distillation_0.py" || result=1
  run_entry_file "$base_dir" "ft_distillation_1.py" || result=1
  
  printf "\n${TAG_PART} III: The Great Transmutation\n"
  
  run_entry_file "$base_dir" "ft_transmutation_0.py" || result=1
  run_entry_file "$base_dir" "ft_transmutation_1.py" || result=1
  run_entry_file "$base_dir" "ft_transmutation_2.py" || result=1
  
  
  printf "\n${TAG_PART} IV: Avoid the Explosion\n"
  
  run_entry_file "$base_dir" "ft_kaboom_0.py" || result=1

	if ! should_skip_empty_file "$base_dir/ft_kaboom_1.py"; then
		printf "\n${TAG_INFO} ft_kaboom_1.py는 의도된 예외가 발생됩니다.\n"

		if ! run_entry_file "$base_dir" "ft_kaboom_1.py"; then
			printf "\n${TAG_INFO} ft_kaboom_1.py 예외 발생 확인\n"
		else
			printf "\n${TAG_WARN} ft_kaboom_1.py는 예외가 발생해야 합니다.\n"
		fi
	fi

  return "$result"
}

run_module_07_tests() {
  local _module="$1"
  local base_dir="$2"
  local result=0

  printf "\n${TAG_TEST} python module 07 실행 테스트\n"

  run_entry_file "$base_dir" "battle.py" || result=1
  run_entry_file "$base_dir" "capacitor.py" || result=1
  run_entry_file "$base_dir" "tournament.py" || result=1

  return "$result"
}

run_module_08_tests() {
  local _module="$1"
  local base_dir="$2"
  local venv_dir
  local venv_preexisting=0
  local result=0

  printf "\n${TAG_TEST} python module 08 실행 테스트\n"

  venv_dir="$(find "$base_dir" -mindepth 1 -maxdepth 1 -type d -name '*env' | head -n 1)"

  if [ -n "$venv_dir" ]; then
    venv_preexisting=1
    venv_dir="$(basename "$venv_dir")"
    printf "\n${TAG_SKIP} 기존 가상환경이 감지되어 Python 버전 검사와 pyenv local 설정을 건너뜁니다: %s\n" "$venv_dir"
  else
    ensure_python_310_for_module "$base_dir" || return 1
    venv_dir="$(ensure_module_venv "$base_dir")" || return 1
  fi

  run_module_08_ex0 "$base_dir" "$venv_dir" || result=1
  run_module_08_ex1 "$base_dir" "$venv_dir" "$venv_preexisting" || result=1
  run_module_08_poetry "$base_dir" || result=1
  run_module_08_ex2 "$base_dir" "$venv_dir" || result=1

  ask_cleanup_module_08 "$base_dir" "$venv_dir"

  return "$result"
}

run_module_08_ex0() {
  local base_dir="$1"
  local venv_dir="$2"
  local result=0

  if should_skip_empty_file "$base_dir/ex0/construct.py"; then
    return 0
  fi

  printf "\n${TAG_RUN} ${YELLOW}ex0${RESET} - python3 construct.py\n"
  (
    cd "$base_dir/ex0" || exit 1
    python3 construct.py
  ) || result=1

  printf "\n${TAG_RUN} ${YELLOW}ex0${RESET} - venv activate 후 python3 construct.py\n"
  (
    cd "$base_dir" || exit 1
    # shellcheck disable=SC1091
    source "$venv_dir/bin/activate"
    cd ex0 || exit 1
    python3 construct.py
    deactivate
  ) || result=1

  return "$result"
}

run_module_08_ex1() {
  local base_dir="$1"
  local venv_dir="$2"
  local venv_preexisting="$3"
  local first_run_log
  local first_run_status
  local result=0

  if should_skip_empty_file "$base_dir/ex1/loading.py"; then
    return 0
  fi

  printf "\n${TAG_RUN} ${YELLOW}ex1${RESET} - 가상환경 비활성 상태에서 loading.py 최초 실행\n"
  first_run_log="$(mktemp)" || return 1
  (
    cd "$base_dir/ex1" || exit 1
    set -o pipefail
    python3 loading.py 2>&1 | tee "$first_run_log"
  )
  first_run_status=$?

  if grep -q '^Traceback (most recent call last):' "$first_run_log"; then
    printf "\n${TAG_ERROR} ex1 최초 실행 중 Python traceback이 감지되었습니다.\n"
    result=1
  elif [ "$first_run_status" -eq 1 ]; then
    printf "\n${TAG_INFO} 의존성 누락으로 인한 종료 코드 1은 정상 테스트 결과로 처리합니다.\n"
  elif [ "$first_run_status" -ne 0 ]; then
    printf "\n${TAG_ERROR} ex1 최초 실행이 종료 코드 %s로 실패했습니다.\n" "$first_run_status"
    result=1
  fi

  rm -f "$first_run_log"

  if [ "$venv_preexisting" -eq 1 ]; then
    printf "\n${TAG_SKIP} 기존 가상환경이 감지되어 requirements.txt 설치를 건너뜁니다.\n"
  elif [ -f "$base_dir/ex1/requirements.txt" ]; then
    printf "\n${TAG_RUN} ${YELLOW}ex1${RESET} - pip install -r requirements.txt\n"
    (
      cd "$base_dir" || exit 1
      # shellcheck disable=SC1091
      source "$venv_dir/bin/activate"
      cd ex1 || exit 1
      pip install -r requirements.txt --no-cache-dir
      deactivate
    ) || result=1
  fi

  if [ "$venv_preexisting" -eq 1 ]; then
    printf "\n${TAG_RUN} ${YELLOW}ex1${RESET} - 기존 venv 활성화 후 loading.py 재실행\n"
  else
    printf "\n${TAG_RUN} ${YELLOW}ex1${RESET} - 생성한 venv 활성화 및 requirements 설치 후 loading.py 재실행\n"
  fi
  (
    cd "$base_dir" || exit 1
    # shellcheck disable=SC1091
    source "$venv_dir/bin/activate"
    cd ex1 || exit 1
    python3 loading.py
    deactivate
  ) || result=1

  return "$result"
}

ensure_poetry_or_choose() {
  local answer

  if poetry --version >/dev/null 2>&1; then
    return 0
  fi

  printf "\n${TAG_WARN} poetry가 설치되어 있지 않습니다.\n"
  printf '1. pip install --user poetry 로 설치\n'
  printf '2. poetry 테스트를 무시하고 계속\n'
  printf '3. 종료\n'
  printf '> '
  read -r answer

  case "$answer" in
    1)
      python3 -m pip install --user poetry
      export PATH="$HOME/.local/bin:$PATH"
      poetry --version >/dev/null 2>&1 || return 1
      ;;
    2)
      return 2
      ;;
    *)
      return 1
      ;;
  esac
}

run_module_08_poetry() {
  local base_dir="$1"
  local status

  ensure_poetry_or_choose
  status=$?

  case "$status" in
    0) ;;
    2)
      printf "\n${TAG_SKIP} poetry 테스트를 건너뜁니다.\n"
      return 0
      ;;
    *)
      return 1
      ;;
  esac

  if [ ! -f "$base_dir/ex1/pyproject.toml" ]; then
    printf "\n${TAG_WARN} ex1/pyproject.toml 파일이 없습니다. poetry 테스트를 건너뜁니다.\n"
    return 0
  fi

  if should_skip_empty_file "$base_dir/ex1/loading.py"; then
    return 0
  fi

  if [ -f "$base_dir/ex1/poetry.lock" ]; then
    printf "\n${TAG_SKIP} ex1/poetry.lock이 감지되어 poetry install을 건너뜁니다.\n"
  else
    printf "\n${TAG_RUN} ${YELLOW}ex1${RESET} - poetry install\n"
    (
      cd "$base_dir/ex1" || exit 1
      poetry install
    ) || return 1
  fi

  printf "\n${TAG_RUN} ${YELLOW}ex1${RESET} - poetry run python loading.py\n"
  (
    cd "$base_dir/ex1" || exit 1
    poetry run python loading.py
  )
}

run_module_08_ex2() {
  local base_dir="$1"
  local venv_dir="$2"
  local answer
  local skip_example_env=0
  local result=0

  if should_skip_empty_file "$base_dir/ex2/oracle.py"; then
    return 0
  fi

  printf "\n${TAG_INFO} python-dotenv 검사\n"
  (
    cd "$base_dir" || exit 1
    # shellcheck disable=SC1091
    source "$venv_dir/bin/activate"

    if ! python3 -c 'import dotenv' >/dev/null 2>&1; then
      pip install python-dotenv --no-cache-dir
    fi

    deactivate
  ) || result=1

  if [ -f "$base_dir/ex2/.env" ]; then
    printf "\n${TAG_WARN} ex2/.env가 감지되었습니다.\n"
    printf '1. 삭제\n'
    printf '2. 무시하고 실행\n'
    printf '3. 종료\n'
    printf '> '
    read -r answer

    case "$answer" in
      1)
        rm -f "$base_dir/ex2/.env"
        ;;
      2)
        skip_example_env=1
        printf "\n${TAG_SKIP} 기존 .env를 유지하며 .env.example 복사 및 재실행을 건너뜁니다.\n"
        ;;
      *)
        return 1
        ;;
    esac
  fi

  printf "\n${TAG_RUN} ${YELLOW}ex2${RESET} - oracle.py 실행\n"
  (
    cd "$base_dir" || exit 1
    # shellcheck disable=SC1091
    source "$venv_dir/bin/activate"
    cd ex2 || exit 1
    python3 oracle.py
    deactivate
  ) || result=1

  if [ "$skip_example_env" -eq 1 ]; then
    return "$result"
  elif [ -f "$base_dir/ex2/.env.example" ]; then
    printf "\n${TAG_RUN} ${YELLOW}ex2${RESET} - cp .env.example .env 후 oracle.py 실행\n"
    (
      cd "$base_dir" || exit 1
      # shellcheck disable=SC1091
      source "$venv_dir/bin/activate"
      cd ex2 || exit 1
      cp .env.example .env
      python3 oracle.py
      deactivate
    ) || result=1
  else
    printf "\n${TAG_WARN} ex2/.env.example 파일이 없습니다.\n"
  fi

  return "$result"
}

cleanup_module_08_poetry_env() {
  local base_dir="$1"
  local env_path
  local found=0

  if ! poetry --version >/dev/null 2>&1; then
    return 0
  fi

  if [ ! -f "$base_dir/ex1/pyproject.toml" ]; then
    return 0
  fi

  (
    cd "$base_dir/ex1" || exit 0

    poetry env list --full-path 2>/dev/null \
      | sed 's/ (Activated)//' \
      | while IFS= read -r env_path; do
          [ -z "$env_path" ] && continue

          case "$(basename "$env_path")" in
            matrix-loading-*)
              found=1

              poetry env remove "$env_path" >/dev/null 2>&1 || true

              if [ -d "$env_path" ]; then
                rm -rf "$env_path"
              fi

              if [ ! -d "$env_path" ]; then
                printf "\n${TAG_DONE} poetry 가상환경 및 캐시 삭제 완료\n"
              else
                printf "\n${TAG_WARN} poetry 가상환경 및 캐시 삭제 실패\n"
              fi
              ;;
          esac
        done
  )
}

ask_cleanup_module_08() {
  local base_dir="$1"
  local venv_dir="$2"
  local answer

  printf "\n${TAG_WARN} module 08 테스트 산출물을 삭제하겠습니까? [Y/n] "
  read -r answer

  case "$answer" in
    n|N|no|NO)
      printf "\n${TAG_SKIP} module 08 산출물 삭제를 건너뜁니다.\n"
      return 0
      ;;
  esac

  [ -n "$venv_dir" ] && rm -rf "$base_dir/$venv_dir"
  rm -f "$base_dir/.python-version"
  find "$base_dir" -type f -name '*.png' -delete
  rm -f "$base_dir/ex1/poetry.lock"
  rm -f "$base_dir/ex2/.env"

  cleanup_module_08_poetry_env "$base_dir"

  printf "\n${TAG_DONE} module 08 테스트 산출물 삭제 완료\n"
}

run_module_09_tests() {
  local base_dir="$2"
  local resource_dir="$SCRIPT_DIR/resource/module_09/data_generator"
  local venv_path
  local venv_created=0
  local result=0

  printf "\n${TAG_TEST} python module 09 실행 테스트\n"

  if [ ! -f "$resource_dir/data_generator.py" ] ||
     [ ! -f "$resource_dir/data_exporter.py" ]; then
    printf "\n${TAG_ERROR} module 09 data_generator 리소스가 없습니다: %s\n" "$resource_dir"
    return 1
  fi

  venv_path="$(find "$base_dir" -mindepth 1 -maxdepth 1 -type d -name '*env' | head -n 1)"

  if [ -n "$venv_path" ]; then
    printf "\n${TAG_INFO} 기존 가상환경을 활성화합니다: %s\n" "$(basename "$venv_path")"
  else
    venv_path="$base_dir/venv"
    venv_created=1
    printf "\n${TAG_CREATE} 가상환경을 생성합니다: venv\n"
    if ! python3 -m venv "$venv_path"; then
      ask_cleanup_module_09 "$base_dir" "$venv_path"
      return 1
    fi
  fi

  if [ ! -f "$venv_path/bin/activate" ]; then
    printf "\n${TAG_ERROR} 가상환경 활성화 파일이 없습니다: %s/bin/activate\n" "$venv_path"
    ask_cleanup_module_09 "$base_dir" "$venv_path"
    return 1
  fi

  if ! cp -R "$resource_dir" "$base_dir/"; then
    printf "\n${TAG_ERROR} data_generator 복사에 실패했습니다.\n"
    ask_cleanup_module_09 "$base_dir" "$venv_path"
    return 1
  fi

  (
    # shellcheck disable=SC1091
    source "$venv_path/bin/activate" || exit 1

    if [ "$venv_created" -eq 1 ]; then
      printf "\n${TAG_RUN} venv - pip install pydantic --no-cache-dir\n"
      python3 -m pip install pydantic --no-cache-dir || exit 1
    fi

    printf "\n${TAG_RUN} data_generator - python3 data_generator/data_exporter.py\n"
    (cd "$base_dir" || exit 1; python3 data_generator/data_exporter.py) || exit 1

    run_entry_file "$base_dir/ex0" "space_station.py" || result=1
    run_entry_file "$base_dir/ex1" "alien_contact.py" || result=1
    run_entry_file "$base_dir/ex2" "space_crew.py" || result=1

    deactivate
    exit "$result"
  ) || result=1

  ask_cleanup_module_09 "$base_dir" "$venv_path"

  return "$result"
}

ask_cleanup_module_09() {
  local base_dir="$1"
  local venv_path="$2"
  local answer

  printf "\n${TAG_WARN} 사용한 가상환경(%s), data_generator, generated_data를 삭제하겠습니까? [Y/n] " \
    "$(basename "$venv_path")"
  read -r answer

  case "$answer" in
    n|N|no|NO)
      printf "\n${TAG_SKIP} module 09 테스트 산출물 삭제를 건너뜁니다.\n"
      return 0
      ;;
  esac

  if [ -n "$venv_path" ]; then
    rm -rf "$venv_path"
  fi
  rm -rf "$base_dir/data_generator"
  rm -rf "$base_dir/generated_data"

  printf "\n${TAG_DONE} module 09 테스트 산출물 삭제 완료\n"
}

run_module_10_tests() {
  local _module="$1"
  local base_dir="$2"
  local resource_dir="$SCRIPT_DIR/resource/module_10"
  local generator_src="$resource_dir/data_generator.py"
  local generator_dst="$base_dir/data_generator.py"
  local result=0

  printf "\n${TAG_TEST} python module 10 실행 테스트\n"

  if [ -f "$generator_src" ]; then
    if should_skip_empty_file "$generator_src"; then
      :
    else
      cp "$generator_src" "$generator_dst"
      printf "\n${TAG_TEST} data_generator.py 전체 샘플 출력\n"
      (
        cd "$base_dir" || exit 1
        printf '5\nq\n' | python3 data_generator.py
      ) || result=1
      rm -f "$generator_dst"
    fi
  else
    printf "\n${TAG_WARN} module 10 data_generator.py 리소스가 없습니다: %s\n" "$generator_src"
  fi

  run_entry_file "$base_dir/ex0" "lambda_spells.py" || result=1
  run_entry_file "$base_dir/ex1" "higher_magic.py" || result=1
  run_entry_file "$base_dir/ex2" "scope_mysteries.py" || result=1
  run_entry_file "$base_dir/ex3" "functools_artifacts.py" || result=1
  run_entry_file "$base_dir/ex4" "decorator_mastery.py" || result=1

  return "$result"
}

# ==============================
# 팁 보기
# ==============================

get_glow_path() {
  printf '%s/.local/bin/glow' "$HOME"
}

install_glow() {
  local cache_dir
  local glow_path
  local archive_url

  glow_path="$(get_glow_path)"
  cache_dir="$SCRIPT_DIR/.glow_cache"
  archive_url="https://github.com/charmbracelet/glow/releases/download/v2.0.0/glow_2.0.0_Linux_x86_64.tar.gz"

  rm -rf "$cache_dir"
  mkdir -p "$cache_dir"
  mkdir -p "$HOME/.local/bin"

  printf "\n${TAG_INFO} glow 설치를 시작합니다.\n"

  (
    cd "$cache_dir" || exit 1

    if ! curl -fL -o glow.tar.gz "$archive_url"; then
      printf "\n${TAG_ERROR} glow 다운로드에 실패했습니다.\n"
      exit 2
    fi

    if ! tar -xzf glow.tar.gz; then
      printf "\n${TAG_ERROR} glow.tar.gz 압축 해제에 실패했습니다.\n"
      exit 3
    fi

    if [ ! -f "glow_2.0.0_Linux_x86_64/glow" ]; then
      printf "\n${TAG_ERROR} glow 바이너리를 찾지 못했습니다.\n"
      exit 4
    fi

    if ! mv glow_2.0.0_Linux_x86_64/glow "$glow_path"; then
      printf "\n${TAG_ERROR} glow 바이너리 이동에 실패했습니다.\n"
      exit 5
    fi

    chmod +x "$glow_path"
  )

  case "$?" in
    0)
      rm -rf "$cache_dir"
      printf "\n${TAG_DONE} glow 설치가 완료되었습니다.(user/.local/bin/glow)\n"
      return 0
      ;;
    *)
      rm -rf "$cache_dir"
      printf "\n${TAG_STOP} glow 설치를 중단했습니다.\n"
      return 1
      ;;
  esac
}

ask_glow_or_cat() {
  local answer
  local next_answer

  printf "\n${TAG_WARN} glow가 설치되어 있지 않습니다. 설치하겠습니까? (16.7 MB)\n"
  printf '1. 설치하기\n'
  printf '2. glow 없이 보기\n'
  printf '3. 초기화면으로 돌아가기\n'
  printf '> '
  read -r answer

  case "$answer" in
    1)
      if ! install_glow; then
        return 2
      fi

      printf '\n설치가 완료되었습니다. 바로 팁을 보겠습니까?\n'
      printf '1. 팁 보기\n'
      printf '2. 초기화면으로 가기\n'
      printf '> '
      read -r next_answer

      case "$next_answer" in
        1)
          return 1
          ;;
        *)
          return 2
          ;;
      esac
      ;;
    2)
      return 0
      ;;
    *)
      return 2
      ;;
  esac
}

show_tip_file() {
  local tip_file="$1"
  local glow_path
  local glow_cmd=""
  local choice
  local tip_module
  local tip_name
  local tip_title

  glow_path="$(get_glow_path)"
  tip_module="$(basename "$(dirname "$tip_file")")"
  tip_name="$(basename "$tip_file" .md)"
  tip_title="python module $tip_module / $tip_name"

  if glow --version >/dev/null 2>&1; then
    glow_cmd="glow"
  elif [ -x "$glow_path" ] && "$glow_path" --version >/dev/null 2>&1; then
    glow_cmd="$glow_path"
  fi

  clear 2>/dev/null || true
  print_line
  printf 'TIP: %s\n' "$tip_title"
  print_line

  if [ -n "$glow_cmd" ]; then
    "$glow_cmd" "$tip_file"
    return 0
  fi

  ask_glow_or_cat
  choice=$?

  case "$choice" in
    0)
      clear 2>/dev/null || true
      print_line
      printf 'TIP: %s\n' "$tip_title"
      print_line
      cat "$tip_file"
      printf '\n'
      ;;
    1)
      glow_path="$(get_glow_path)"

      if [ -x "$glow_path" ] && "$glow_path" --version >/dev/null 2>&1; then
        clear 2>/dev/null || true
        print_line
        printf 'TIP: %s\n' "$tip_title"
        print_line
        "$glow_path" "$tip_file"
      else
        printf "\n${TAG_ERROR} glow 설치 후에도 실행 파일을 찾지 못했습니다.\n"
        return 1
      fi
      ;;
    *)
      return 1
      ;;
  esac
}

get_module_name_var() {
  printf 'MODULE_%s_NAME' "$1"
}

get_module_name() {
  local var_name

  var_name="$(get_module_name_var "$1")"
  eval 'printf "%s" "${'"$var_name"':-이름 미등록}"'
}

list_tip_modules() {
  local tips_root="$SCRIPT_DIR/resource/tips"
  local dir
  local module
  local name
  local found=0

  if [ ! -d "$tips_root" ]; then
    return 1
  fi

  for dir in "$tips_root"/*; do
    [ -d "$dir" ] || continue

    module="$(basename "$dir")"

    if [[ "$module" =~ ^[0-9]$ ]]; then
      module="0$module"
    fi

    name="$(get_module_name "$module")"

    printf '%s. "%s"\n' "$module" "$name"
    found=1
  done | sort -V

  [ "$found" -eq 1 ]
}

list_tip_files() {
  local module="$1"
  local module_dir="$SCRIPT_DIR/resource/tips/$module"
  local file
  local filename
  local number
  local title
  local found=0

  if [ ! -d "$module_dir" ]; then
    return 1
  fi

  while IFS= read -r file; do
    [ -f "$file" ] || continue

    filename="$(basename "$file" .md)"
    number="${filename%%_*}"
    title="${filename#*_}"

    printf '%s. %s\n' "$number" "$title"

    found=1
  done < <(find "$module_dir" -maxdepth 1 -type f -name '*.md' | sort -V)

  [ "$found" -eq 1 ]
}

get_tip_file_by_index() {
  local module="$1"
  local target_index="$2"
  local module_dir="$SCRIPT_DIR/resource/tips/$module"
  local file
  local filename
  local number
  local normalized_target
  local normalized_number

  if ! [[ "$target_index" =~ ^[0-9]+$ ]]; then
    return 1
  fi

  normalized_target="$target_index"

  if [[ "$target_index" =~ ^[0-9]$ ]]; then
    normalized_target="0$target_index"
  fi

  while IFS= read -r file; do
    [ -f "$file" ] || continue

    filename="$(basename "$file" .md)"
    number="${filename%%_*}"

    normalized_number="$number"
    if [[ "$number" =~ ^[0-9]$ ]]; then
      normalized_number="0$number"
    fi

    if [ "$normalized_number" = "$normalized_target" ]; then
      printf '%s' "$file"
      return 0
    fi
  done < <(find "$module_dir" -maxdepth 1 -type f -name '*.md' | sort -V)

  return 1
}

select_tip_module() {
  local module
  local modules

  modules="$(list_tip_modules)"

  if [ -z "$modules" ]; then
    printf "\n${TAG_WARN} tip이 업데이트되어있지 않습니다.\n"
    return 1
  fi

  print_line
  printf '팁을 볼 module 번호를 선택하세요.\n\n'
  printf '%s\n\n' "$modules"
  printf '> '
  read -r module

  if [ -z "$module" ]; then
    printf "\n${TAG_ERROR} module 번호가 입력되지 않았습니다.\n"
    return 1
  fi

  if [[ "$module" =~ ^[0-9]$ ]]; then
    module="0$module"
  fi

  if [ ! -d "$SCRIPT_DIR/resource/tips/$module" ]; then
    printf "\n${TAG_ERROR} 해당 module tip이 없습니다: %s\n" "$module"
    return 1
  fi

  select_tip_file "$module"
}

select_tip_file() {
  local module="$1"
  local tip_index
  local tip_files
  local tip_file

  tip_files="$(list_tip_files "$module")"

  if [ -z "$tip_files" ]; then
    printf "\n${TAG_WARN} tip이 업데이트되어있지 않습니다.\n"
    return 1
  fi

  print_line
  printf 'module %s에서 볼 tip 번호를 입력하세요.\n\n' "$module"
  printf '%s\n\n' "$tip_files"
  printf '> '
  read -r tip_index
  
  if [ -z "$tip_index" ]; then
    printf "\n${TAG_ERROR} tip 번호가 입력되지 않았습니다.\n"
    return 1
  fi

  tip_file="$(get_tip_file_by_index "$module" "$tip_index")"

  if [ -z "$tip_file" ]; then
    printf "\n${TAG_ERROR} 해당 번호의 tip 파일이 없습니다: %s\n" "$tip_index"
    return 1
  fi

  show_tip_file "$tip_file"
}

# ==============================
# 설정 페이지
# ==============================

save_config() {
  printf 'PROJECT_ROOT="%s"\n' "$PROJECT_ROOT" > "$CONFIG_FILE"
  printf 'MODULE_DIR_NAME="%s"\n' "$MODULE_DIR_NAME" >> "$CONFIG_FILE"
}

looks_like_module_dir() {
  local module="$1"
  local dir="$2"
  local item

  while IFS= read -r item; do
    [ -z "$item" ] && continue

    if [ ! -e "$dir/$item" ]; then
      return 1
    fi
  done < <(get_module_files "$module")

  return 0
}

sync_module_dir_names() {
  local module
  local expected_dir
  local expected_name
  local dir
  local matched_dirs=""
  local rename_pairs=""
  local count
  local answer
  local src
  local dst
  local has_error=0

  for module in "${REGISTERED_MODULES[@]}"; do
    expected_dir="$(module_dir "$module")"
    expected_name="$(basename "$expected_dir")"
    matched_dirs=""

    for dir in "$PROJECT_ROOT"/*; do
      [ -d "$dir" ] || continue
      [ "$dir" = "$expected_dir" ] && continue

      if looks_like_module_dir "$module" "$dir"; then
        matched_dirs="${matched_dirs}${dir}"$'\n'
      fi
    done

    count="$(printf '%s' "$matched_dirs" | sed '/^$/d' | wc -l)"

    if [ "$count" -ge 2 ]; then
      printf "\n${TAG_ERROR} module %s로 보이는 폴더가 2개 이상입니다. 이름 변경을 건너뜁니다.\n" "$module"
      printf '%s' "$matched_dirs" | sed '/^$/d'
      has_error=1
      continue
    fi

    if [ "$count" -eq 1 ]; then
      src="$(printf '%s' "$matched_dirs" | sed '/^$/d')"
      dst="$expected_dir"

      if [ -e "$dst" ]; then
        printf "\n${TAG_ERROR} 변경 대상 폴더가 이미 존재합니다: %s\n" "$dst"
        has_error=1
        continue
      fi

      rename_pairs="${rename_pairs}${src}|${dst}"$'\n'
    fi
  done

  if [ -z "$(printf '%s' "$rename_pairs" | sed '/^$/d')" ]; then
    if [ "$has_error" -eq 0 ]; then
      printf "\n${TAG_INFO} 변경할 모듈 폴더가 없습니다.\n"
    fi
    return "$has_error"
  fi

  printf "\n${TAG_INFO} 모듈 폴더가 감지되었습니다:\n\n"

  while IFS='|' read -r src dst; do
    [ -z "$src" ] && continue
    printf '%s - %s\n' "$(basename "$src")" "$(basename "$dst")"
  done <<< "$rename_pairs"

  printf '\n모든 모듈 폴더명을 서식에 맞게 변경하겠습니까? [Y/n] '
  read -r answer

  case "$answer" in
    n|N|no|NO)
      printf "\n${TAG_SKIP} 폴더명 변경을 건너뜁니다.\n"
      return "$has_error"
      ;;
  esac

  while IFS='|' read -r src dst; do
    [ -z "$src" ] && continue

    if [ -e "$dst" ]; then
      printf "\n${TAG_ERROR} 변경 대상 폴더가 이미 존재하여 건너뜁니다: %s\n" "$dst"
      has_error=1
      continue
    fi

    mv "$src" "$dst"
    printf "\n${TAG_DONE} 폴더명 변경: %s -> %s\n" "$(basename "$src")" "$(basename "$dst")"
  done <<< "$rename_pairs"

  return "$has_error"
}

reset_helper_config() {
  local answer

  printf "\n${TAG_WARN} 헬퍼 설정을 초기화하시겠습니까? [Y/n] "
  read -r answer

  case "$answer" in
    n|N|no|NO)
      printf "\n${TAG_SKIP} 설정 초기화를 취소했습니다.\n"
      ;;
    *)
      if [ -f "$BASE_CONFIG_FILE" ]; then
        cp "$BASE_CONFIG_FILE" "$CONFIG_FILE"
        # shellcheck disable=SC1090
        source "$CONFIG_FILE"
        printf "\n${TAG_DONE} 헬퍼 설정을 base.env 기준으로 초기화했습니다.\n"
      else
        rm -f "$CONFIG_FILE"
        PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
        MODULE_DIR_NAME="python_module_"
        printf "\n${TAG_DONE} 헬퍼 설정을 기본값으로 초기화했습니다.\n"
      fi
      ;;
  esac
}

select_project_root() {
  local new_root

  print_line
  printf '현재 Project Root:\n%s\n\n' "$PROJECT_ROOT"
  printf '새 Project Root 경로를 입력하세요.\n'
  printf '> '
  read -e -r new_root

  if [ ! -d "$new_root" ]; then
    printf "\n${TAG_ERROR} 존재하지 않는 경로입니다: %s\n" "$new_root"
    return 1
  fi

  PROJECT_ROOT="$new_root"
  save_config
  printf "\n${TAG_DONE} 프로젝트 루트가 저장되었습니다: %s\n" "$PROJECT_ROOT"

	sync_module_dir_names
}

select_module_dir_name() {
  local new_name

  print_line
  printf '현재 모듈 폴더명 서식:\n%s\n\n' "$MODULE_DIR_NAME"
  printf '새 모듈 폴더명 서식을 입력하세요.\n'
  printf '예: python_module_  → python_module_00\n'
  printf '예: module_         → module_00\n'
	printf '빈 값 입력 시       → 00, 01, 02\n'
  printf '> '
  read -r new_name

  MODULE_DIR_NAME="$new_name"
  save_config
  printf "\n${TAG_DONE} 모듈 폴더명 서식이 저장되었습니다: %s\n" "$MODULE_DIR_NAME"

	sync_module_dir_names
}

update_helper_from_git() {
  local answer
  local behind_count

  if [ ! -d "$SCRIPT_DIR/.git" ]; then
    printf "\n${TAG_ERROR} 현재 헬퍼 디렉토리가 git 저장소가 아닙니다: %s\n" "$SCRIPT_DIR"
    return 1
  fi

  if ! git -C "$SCRIPT_DIR" fetch origin main >/dev/null 2>&1; then
    printf "\n${TAG_ERROR} 원격 저장소 확인에 실패했습니다.\n"
    return 1
  fi

  behind_count="$(git -C "$SCRIPT_DIR" rev-list --count HEAD..origin/main 2>/dev/null)"

  if [ -z "$behind_count" ] || [ "$behind_count" -eq 0 ]; then
    printf "\n${TAG_INFO} 현재 최신버전입니다.\n"
    return 0
  fi

  printf "\n${TAG_INFO} 헬퍼 업데이트가 가능합니다.\n"
  printf '업데이트 로그:\n\n'
  git -C "$SCRIPT_DIR" log --oneline --no-merges HEAD..origin/main
  printf '\n'
  read -r answer

  case "$answer" in
    n|N|no|NO)
      printf "\n${TAG_SKIP} 헬퍼 업데이트를 건너뜁니다.\n"
      return 0
      ;;
  esac

  if git -C "$SCRIPT_DIR" pull --ff-only origin main; then
    printf "\n${TAG_DONE} 헬퍼 업데이트가 완료되었습니다. 다시 실행해주세요.\n"
    exit 0
  fi

  printf "\n${TAG_ERROR} 헬퍼 업데이트에 실패했습니다.\n"
  return 1
}

helper_settings_menu() {
  local choice

  while true; do
    clear 2>/dev/null || true
    print_line
    printf '%b %b\n\n' "$TITLE_MAIN" "$TITLE_SUB"
		printf '헬퍼 기본설정 페이지\n\n'
    printf "${CYAN}루트 경로:${RESET} %s\n" "$PROJECT_ROOT"
    printf "${CYAN}폴더 서식:${RESET} %s\n\n" "$MODULE_DIR_NAME"
    print_line
    printf '0. 설정 초기화\n'
    printf '1. 프로젝트 루트 변경\n'
    printf '2. 모듈 폴더명 서식 변경\n'
    printf '3. python module helper 업데이트\n'
    printf '4. 초기화면으로 돌아가기\n'
    print_line
    printf '> '
    read -r choice

    case "$choice" in
      0)
        reset_helper_config
        pause
        ;;
      1)
        select_project_root
        pause
        ;;
      2)
        select_module_dir_name
        pause
        ;;
      3)
        update_helper_from_git
        pause
        ;;
      4)
        return 0
        ;;
      *)
        printf "\n${TAG_ERROR} 잘못된 입력입니다.\n"
        pause
        ;;
    esac
  done
}

# ==============================
# 메인 메뉴
# ==============================

show_manual() {
  local manual_file="$SCRIPT_DIR/resource/manual.txt"

  clear 2>/dev/null || true
  print_line
  printf '42 Python Module Helper Manual\n'
  print_line

  if [ ! -f "$manual_file" ]; then
    printf "\n${TAG_WARN} 메뉴얼 파일이 없습니다: %s\n" "$manual_file"
    return 1
  fi

  cat "$manual_file"
  printf '\n'
}

ask_continue() {
  local answer

  printf '\n처음 메뉴로 돌아가시겠습니까? [Y/n (no = exit)] '
  read -r answer

  case "$answer" in
    n|N|no|NO)
      exit 0
      ;;
    *)
      return 0
      ;;
  esac
}

main_menu() {
  local choice

  while true; do
    clear 2>/dev/null || true
    print_line
    printf '%b %b\n\n' "$TITLE_MAIN" "$TITLE_SUB"
    printf "${CYAN}Project Root:${RESET}%s\n" "$PROJECT_ROOT"
    print_line
    printf '0. 사용법 보기\n'
    printf '1. 디렉토리/파일 생성\n'
    printf '2. 정적 검사 및 실행 테스트\n'
    printf '3. 과제 팁 보기\n'
		printf '4. 헬퍼 설정\n'
    printf '5. 다 집어치우고 종료\n'
    print_line
    printf '> '
    read -r choice

    case "$choice" in
      0)
        show_manual
        ask_continue
        ;;
      1)
        select_create_modules
        ask_continue
        ;;
      2)
        select_test_module
        ask_continue
        ;;
      3)
        select_tip_module
        ask_continue
        ;;
      4)
				helper_settings_menu
        ;;
      5)
        clear 2>/dev/null || true
        printf 'Python Module Helper : 수고!!\n'
        exit 0
        ;;
      *)
        printf "\n${TAG_ERROR} 잘못된 입력입니다.\n"
        pause
        ;;
    esac
  done
}

main_menu
