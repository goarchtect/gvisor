#!/bin/bash

# Copyright 2019 The gVisor Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

source $(dirname $0)/common.sh

# Check that a runtime is provided.
if [ ! -v RUNTIME_TEST_NAME ]; then
  echo "Must set $RUNTIME_TEST_NAME" >&2
  exit 1
fi

# Download language runtime image.
make -C images/ "load-runtimes_${RUNTIME_TEST_NAME}"

install_runsc_for_test runtimes
test_runsc "//test/runtimes:${RUNTIME_TEST_NAME}"