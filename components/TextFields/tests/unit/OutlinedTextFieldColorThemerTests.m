/*
 Copyright 2018-present the Material Components for iOS authors. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import <XCTest/XCTest.h>

#import "MDCTextInputBorderView.h"
#import "MaterialColorScheme.h"
#import "MaterialTextFields.h"
#import "MaterialTextFields+ColorThemer.h"

@interface OutlinedTextFieldColorThemerTests : XCTestCase

@end

@implementation OutlinedTextFieldColorThemerTests

- (void)testThemerWithBaselineColorSchemeAppliesToSingleLineTextField {
  // Given
  MDCTextField *textField = [[MDCTextField alloc] init];
  MDCTextInputControllerOutlined *controller =
      [[MDCTextInputControllerOutlined alloc] initWithTextInput:textField];
  MDCSemanticColorScheme *colorScheme = [[MDCSemanticColorScheme alloc] init];

  // When
  [MDCOutlinedTextFieldColorThemer applySemanticColorScheme:colorScheme
                                      toTextInputController:controller];

  // Then
  XCTAssertEqualObjects(controller.activeColor, colorScheme.primaryColor);
  XCTAssertEqualObjects(controller.errorColor, colorScheme.errorColor);
  XCTAssertEqualObjects(controller.trailingUnderlineLabelTextColor,
                        [colorScheme.onSurfaceColor colorWithAlphaComponent:0.6f]);
  XCTAssertEqualObjects(textField.trailingUnderlineLabel.textColor,
                        controller.trailingUnderlineLabelTextColor);
  XCTAssertEqualObjects(controller.normalColor,
                        [colorScheme.onSurfaceColor colorWithAlphaComponent:0.6f]);
  XCTAssertEqualObjects(textField.borderView.borderStrokeColor, controller.normalColor);
  XCTAssertEqualObjects(controller.inlinePlaceholderColor,
                        [colorScheme.onSurfaceColor colorWithAlphaComponent:0.6f]);
  XCTAssertEqualObjects(textField.placeholderLabel.textColor, controller.inlinePlaceholderColor);
  // Set directly in the themer, not by the controller
  XCTAssertEqualObjects(textField.textColor,
                        [colorScheme.onSurfaceColor colorWithAlphaComponent:0.87f]);
  XCTAssertEqualObjects(controller.leadingUnderlineLabelTextColor,
                        [colorScheme.onSurfaceColor colorWithAlphaComponent:0.6f]);
  XCTAssertEqualObjects(textField.leadingUnderlineLabel.textColor,
                        controller.leadingUnderlineLabelTextColor);
  XCTAssertEqualObjects(controller.textInputClearButtonTintColor,
                        [colorScheme.onSurfaceColor colorWithAlphaComponent:0.54f]);
  XCTAssertEqualObjects(textField.clearButton.tintColor, controller.textInputClearButtonTintColor);
  XCTAssertEqualObjects(controller.floatingPlaceholderNormalColor,
                        [colorScheme.onSurfaceColor colorWithAlphaComponent:0.6f]);
  XCTAssertEqualObjects(textField.placeholderLabel.textColor,
                        controller.floatingPlaceholderNormalColor);
  XCTAssertEqualObjects(controller.floatingPlaceholderActiveColor,
                        [colorScheme.primaryColor colorWithAlphaComponent:0.87f]);
}

// TODO(https://github.com/material-components/material-components-ios/issues/4443 ): Restore this
// test
- (void)_disabled_testThemerWithBaselineColorSchemeAppliesToSingleLineTextFieldDisabledState {
  // Given
  MDCTextField *textField = [[MDCTextField alloc] init];
  MDCTextInputControllerOutlined *controller =
      [[MDCTextInputControllerOutlined alloc] initWithTextInput:textField];
  MDCSemanticColorScheme *colorScheme = [[MDCSemanticColorScheme alloc] init];

  // When
  [MDCOutlinedTextFieldColorThemer applySemanticColorScheme:colorScheme
                                      toTextInputController:controller];
  textField.enabled = NO;

  // Then
  XCTAssertEqualObjects(controller.disabledColor,
                        [colorScheme.onSurfaceColor colorWithAlphaComponent:0.38f]);
  XCTAssertEqualObjects(textField.underline.disabledColor, controller.disabledColor);
}

- (void)testThemerWithBaselineColorSchemeAppliesToMultilineTextField {
  // Given
  MDCMultilineTextField *textField = [[MDCMultilineTextField alloc] init];
  MDCTextInputControllerOutlinedTextArea *controller =
      [[MDCTextInputControllerOutlinedTextArea alloc] initWithTextInput:textField];
  MDCSemanticColorScheme *colorScheme = [[MDCSemanticColorScheme alloc] init];

  // When
  [MDCOutlinedTextFieldColorThemer applySemanticColorScheme:colorScheme
                                      toTextInputController:controller];

  // Then
  XCTAssertEqualObjects(controller.activeColor, colorScheme.primaryColor);
  XCTAssertEqualObjects(controller.errorColor, colorScheme.errorColor);
  XCTAssertEqualObjects(controller.trailingUnderlineLabelTextColor,
                        [colorScheme.onSurfaceColor colorWithAlphaComponent:0.6f]);
  XCTAssertEqualObjects(textField.trailingUnderlineLabel.textColor,
                        controller.trailingUnderlineLabelTextColor);
  XCTAssertEqualObjects(controller.normalColor,
                        [colorScheme.onSurfaceColor colorWithAlphaComponent:0.6f]);
  XCTAssertEqualObjects(textField.underline.color, controller.normalColor);
  XCTAssertEqualObjects(textField.borderView.borderStrokeColor, controller.normalColor);
  XCTAssertEqualObjects(controller.inlinePlaceholderColor,
                        [colorScheme.onSurfaceColor colorWithAlphaComponent:0.6f]);
  XCTAssertEqualObjects(textField.placeholderLabel.textColor, controller.inlinePlaceholderColor);
  // Set directly in the themer, not by the controller
  XCTAssertEqualObjects(textField.textColor,
                        [colorScheme.onSurfaceColor colorWithAlphaComponent:0.87f]);
  XCTAssertEqualObjects(controller.leadingUnderlineLabelTextColor,
                        [colorScheme.onSurfaceColor colorWithAlphaComponent:0.6f]);
  XCTAssertEqualObjects(textField.leadingUnderlineLabel.textColor,
                        controller.leadingUnderlineLabelTextColor);
  XCTAssertEqualObjects(controller.textInputClearButtonTintColor,
                        [colorScheme.onSurfaceColor colorWithAlphaComponent:0.54f]);
  XCTAssertEqualObjects(textField.clearButton.tintColor, controller.textInputClearButtonTintColor);
  XCTAssertEqualObjects(controller.floatingPlaceholderNormalColor,
                        [colorScheme.onSurfaceColor colorWithAlphaComponent:0.6f]);
  XCTAssertEqualObjects(textField.placeholderLabel.textColor,
                        controller.floatingPlaceholderNormalColor);
  XCTAssertEqualObjects(controller.floatingPlaceholderActiveColor,
                        [colorScheme.primaryColor colorWithAlphaComponent:0.87f]);
}

// TODO(https://github.com/material-components/material-components-ios/issues/4443 ): Restore this
// test
- (void)_disabled_testThemerWithBaselineColorSchemeAppliesToMultilineTextFieldDisabledState {
  // Given
  MDCMultilineTextField *textField = [[MDCMultilineTextField alloc] init];
  MDCTextInputControllerOutlinedTextArea *controller =
      [[MDCTextInputControllerOutlinedTextArea alloc] initWithTextInput:textField];
  MDCSemanticColorScheme *colorScheme = [[MDCSemanticColorScheme alloc] init];

  // When
  [MDCOutlinedTextFieldColorThemer applySemanticColorScheme:colorScheme
                                      toTextInputController:controller];
  textField.enabled = NO;

  // Then
  XCTAssertEqualObjects(controller.disabledColor,
                        [colorScheme.onSurfaceColor colorWithAlphaComponent:0.38f]);
  XCTAssertEqualObjects(textField.underline.disabledColor, controller.disabledColor);
}

@end
