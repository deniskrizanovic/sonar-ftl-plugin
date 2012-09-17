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
package org.sonar.plugins.ftl.checks.comments;

import org.sonar.check.Priority;
import org.sonar.check.Rule;
import org.sonar.plugins.ftl.checks.AbstractPageCheck;
import org.sonar.plugins.ftl.node.CommentNode;
import org.sonar.plugins.ftl.node.DirectiveNode;
import org.sonar.plugins.ftl.visitor.FtlSourceCode;

/**
 * Checker for occurrence of html comments.
 *
 * HTML comment is not allowed in JSP files, use server side comment instead. The check allows HTML comment in XHTML files, recognized by
 * its xml declaration.
 *
 * @author Matthijs Galesloot
 * @since 1.0
 */
@Rule(key = "AvoidHtmlCommentCheck", priority = Priority.MINOR)
public class AvoidHtmlCommentCheck extends AbstractPageCheck {

  private boolean xmlDocument;

  @Override
  public void comment(CommentNode node) {
    if (!xmlDocument && node.isHtml()) {
      createViolation(node.getStartLinePosition(), "Avoid HTML comment in JSP files, use server side comment instead.");
    }
  }

  @Override
  public void directive(DirectiveNode node) {
    if (node.isXml()) {
      xmlDocument = true;
    }
  }

  @Override
  public void startDocument(FtlSourceCode ftlSourceCode) {
    super.startDocument(ftlSourceCode);
    xmlDocument = false;
  }
}
