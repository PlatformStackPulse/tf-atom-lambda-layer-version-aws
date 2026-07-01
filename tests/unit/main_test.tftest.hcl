# Unit Tests for tf-atom-lambda-layer-version-aws
#
# These tests use a mock AWS provider — no real AWS calls are made.
# Run with:         terraform test -test-directory=tests/unit
# Run verbose:      terraform test -test-directory=tests/unit -verbose
# Run a single run: terraform test -test-directory=tests/unit -run "creates_when_enabled"
#
# NOTE: assertions target plan-KNOWN values only (the tf-label context and
# the `enabled` flag). Computed AWS attributes (arn/id) are unknown under a
# mock provider and would error if asserted on.

mock_provider "aws" {}

variables {
  namespace = "eg"
  stage     = "test"
  name      = "thing"
}

# ---------------------------------------------------------------------------
# Test: module is enabled by default and exposes the enabled flag
# ---------------------------------------------------------------------------
run "creates_when_enabled" {
  command = plan

  assert {
    condition     = output.enabled == true
    error_message = "Module should be enabled by default (enabled output must be true)."
  }
}

# ---------------------------------------------------------------------------
# Test: disabling the module turns the enabled flag off
# ---------------------------------------------------------------------------
run "disabled_creates_nothing" {
  command = plan

  variables {
    enabled = false
  }

  assert {
    condition     = output.enabled == false
    error_message = "When enabled = false, the enabled output must be false (module creates nothing)."
  }
}
