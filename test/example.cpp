#include <gtest/gtest.h>

#include <yacppbp/example.hpp>

TEST(Example, IsWorking) {
  EXPECT_EQ(example(), 42);
}
