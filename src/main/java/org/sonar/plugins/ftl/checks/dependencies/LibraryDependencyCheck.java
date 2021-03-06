/*
 * Sonar Web Plugin
 * Copyright (C) 2010 Matthijs Galesloot
 * dev@sonar.codehaus.org
 *
 * Licensed under the Apache License, Version 2.0 (the "License")
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.sonar.plugins.ftl.checks.dependencies;

import org.apache.commons.lang.StringUtils;
import org.sonar.check.Priority;
import org.sonar.check.Rule;
import org.sonar.check.RuleProperty;
import org.sonar.plugins.ftl.checks.AbstractPageCheck;
import org.sonar.plugins.ftl.node.Attribute;
import org.sonar.plugins.ftl.node.DirectiveNode;
import org.sonar.plugins.ftl.node.ExpressionNode;

/**
 * Checker to find libraries that should not be used.
 *
 * @author Matthijs Galesloot
 * @since 1.0
 */
@Rule(key = "LibraryDependencyCheck", priority = Priority.CRITICAL)
public class LibraryDependencyCheck extends AbstractPageCheck {

  @RuleProperty
  private String[] libraries;

  public String getLibraries() {
    if (libraries != null) {
      return StringUtils.join(libraries, ",");
    }
    return "";
  }

  public void setLibraries(String list) {
    libraries = trimSplitCommaSeparatedList(list);
  }

  @Override
  public void directive(DirectiveNode node) {
    if (libraries != null && node.isJsp() && "page".equalsIgnoreCase(node.getNodeName())) {
      for (Attribute a : node.getAttributes()) {
        if (isIllegalImport(a)) {
          createViolation(node.getStartLinePosition(), "Using '" + a.getValue() + "' library is not allowed.");
        }
      }
    }
  }

  @Override
  public void expression(ExpressionNode node) {
    for (String library : libraries) {
      if (node.getCode().contains(library)) {
        createViolation(node.getStartLinePosition(), "Using '" + library + "' library is not allowed.");
      }
    }
  }

  private boolean isIllegalImport(Attribute a) {
    if ("import".equals(a.getName())) {
      for (String library : libraries) {
        if (a.getValue().contains(library)) {
          return true;
        }
      }
    }
    return false;
  }
}
