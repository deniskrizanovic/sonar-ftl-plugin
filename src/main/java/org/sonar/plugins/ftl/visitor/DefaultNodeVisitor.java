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
package org.sonar.plugins.ftl.visitor;

import org.sonar.plugins.ftl.node.CommentNode;
import org.sonar.plugins.ftl.node.DirectiveNode;
import org.sonar.plugins.ftl.node.ExpressionNode;
import org.sonar.plugins.ftl.node.Node;
import org.sonar.plugins.ftl.node.TagNode;
import org.sonar.plugins.ftl.node.TextNode;

import java.util.List;

/**
 * Defines interface for node visitor with default dummy implementations.
 *
 * @author Matthijs Galesloot
 * @since 1.0
 */
public class DefaultNodeVisitor implements NodeVisitor {

  private FtlSourceCode ftlSourceCode;

  public void characters(TextNode textNode) {

  }

  public void comment(CommentNode node) {

  }

  public void directive(DirectiveNode node) {

  }

  public void endDocument() {

  }

  public void endElement(TagNode node) {

  }

  public void expression(ExpressionNode node) {

  }

  public FtlSourceCode getFtlSourceCode() {
    return ftlSourceCode;
  }

  public void startDocument(FtlSourceCode ftlSourceCode, List<Node> nodes) {
    startDocument(ftlSourceCode);
  }

  public void startDocument(FtlSourceCode ftlSourceCode) {
    this.ftlSourceCode = ftlSourceCode;
  }

  public void startElement(TagNode node) {

  }
}
