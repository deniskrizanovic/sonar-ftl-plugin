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
package org.sonar.plugins.ftl.checks.style;

import org.sonar.check.Priority;
import org.sonar.check.Rule;
import org.sonar.plugins.ftl.checks.AbstractPageCheck;
import org.sonar.plugins.ftl.node.TagNode;

/**
 * Checker for occurrence of inline style.
 *
 * @see http://java.sun.com/developer/technicalArticles/javaserverpages/code_convention/ paragraph Cascading Style Sheets
 *
 * @author Matthijs Galesloot
 * @since 1.0
 */
@Rule(key = "InlineStyleCheck", priority = Priority.MINOR)
public class InlineStyleCheck extends AbstractPageCheck {

  @Override
  public void startElement(TagNode element) {

    if ("style".equalsIgnoreCase(element.getLocalName())) {
      createViolation(element.getStartLinePosition(), "Avoid inline CSS styles.");
    }
  }
}
