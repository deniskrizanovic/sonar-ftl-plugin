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
package org.sonar.plugins.ftl.checks.scripting;

import org.sonar.check.Priority;
import org.sonar.check.Rule;
import org.sonar.check.RuleProperty;
import org.sonar.plugins.ftl.checks.AbstractPageCheck;
import org.sonar.plugins.ftl.node.TagNode;
import org.sonar.plugins.ftl.node.TextNode;

/**
 * Checker to find long javascripts.
 *
 * @author Matthijs Galesloot
 * @since 1.0
 *
 * @see http://pmd.sourceforge.net/rules/basic-jsp.html
 */
@Rule(key = "LongJavaScriptCheck", priority = Priority.CRITICAL)
public class LongJavaScriptCheck extends AbstractPageCheck {

  private static final int DEFAULT_MAX_LINES = 5;

  private int linesOfCode;

  @RuleProperty(defaultValue = "" + DEFAULT_MAX_LINES)
  private int maxLines = DEFAULT_MAX_LINES;

  private TagNode scriptNode;

  @Override
  public void characters(TextNode textNode) {
    if (scriptNode != null) {
      linesOfCode += textNode.getLinesOfCode();

      if (linesOfCode > maxLines) {
        createViolation(scriptNode.getStartLinePosition(), "The length of this JS script (" + linesOfCode +
          ") exceeds the maximum set to " + maxLines + ".");
        scriptNode = null;
      }
    }
  }

  @Override
  public void endElement(TagNode element) {
    scriptNode = null;
  }

  public int getMaxLines() {
    return maxLines;
  }

  public void setMaxLines(int maxLines) {
    this.maxLines = maxLines;
  }

  @Override
  public void startElement(TagNode element) {
    if ("script".equalsIgnoreCase(element.getNodeName())) {
      scriptNode = element;
      linesOfCode = 0;
    }
  }
}