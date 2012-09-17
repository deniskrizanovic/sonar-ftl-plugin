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
package org.sonar.plugins.ftl.analyzers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.sonar.api.measures.CoreMetrics;
import org.sonar.plugins.ftl.node.Node;
import org.sonar.plugins.ftl.node.TextNode;
import org.sonar.plugins.ftl.visitor.DefaultNodeVisitor;
import org.sonar.plugins.ftl.visitor.FtlSourceCode;

import java.util.List;

/**
 * Count lines of code in ftl files.
 *
 * @author Matthijs Galesloot
 * @since 1.0
 */
public class PageCountLines extends DefaultNodeVisitor {

  private static final Logger LOG = LoggerFactory.getLogger(PageCountLines.class);

  private int blankLines;
  private int commentLines;
  private int headerCommentLines;
  private int linesOfCode;

  @Override
  public void startDocument(FtlSourceCode ftlSourceCode, List<Node> nodes) {
    super.startDocument(ftlSourceCode, nodes);

    linesOfCode = 0;
    blankLines = 0;
    commentLines = 0;
    headerCommentLines = 0;

    count(nodes);
  }

  private void addMeasures() {

    getFtlSourceCode().addMeasure(CoreMetrics.LINES, (double) linesOfCode + commentLines + headerCommentLines + blankLines);
    getFtlSourceCode().addMeasure(CoreMetrics.NCLOC, linesOfCode);
    getFtlSourceCode().addMeasure(CoreMetrics.COMMENT_LINES, commentLines);

    LOG.debug("FtlSensor: " + getFtlSourceCode().toString() + ":" + linesOfCode + "," + commentLines + "," + headerCommentLines + "," + blankLines);
  }

  private void count(List<Node> nodeList) {
    for (int i = 0; i < nodeList.size(); i++) {
      Node node = nodeList.get(i);
      Node previousNode = i > 0 ? nodeList.get(i - 1) : null;
      Node nextNode = i < nodeList.size() - 1 ? nodeList.get(i) : null;
      handleToken(node, previousNode, nextNode);
    }
    addMeasures();
  }

  private void handleToken(Node node, Node previousNode, Node nextNode) {

    int linesOfCodeCurrentNode = node.getLinesOfCode();
    if (nextNode == null) {
      linesOfCodeCurrentNode++;
    }

    switch (node.getNodeType()) {
      case Tag:
      case Directive:
      case Expression:
        linesOfCode += linesOfCodeCurrentNode;
        break;
      case Comment:
        if (previousNode == null) {
          // this is a header comment
          headerCommentLines += linesOfCodeCurrentNode;
        } else {
          commentLines += linesOfCodeCurrentNode;
        }
        break;
      case Text:
        handleTextToken((TextNode) node, previousNode, linesOfCodeCurrentNode);

        break;
      default:
        break;
    }
  }

  private void handleTextToken(TextNode textNode, Node previousNode, int linesOfCodeCurrentNode) {

    if (textNode.isBlank() && linesOfCodeCurrentNode > 0) {
      int nonBlankLines = 0;

      // add one newline to the previous node
      if (previousNode != null) {
        switch (previousNode.getNodeType()) {
          case Comment:
            if (previousNode.getStartLinePosition() == 1) {
              // this was a header comment
              headerCommentLines++;
            } else {
              commentLines++;
            }
            nonBlankLines++;
            break;
          case Tag:
          case Directive:
          case Expression:
            linesOfCode++;
            nonBlankLines++;
            break;
          default:
            break;
        }
      }

      // remaining newlines are added to blanklines
      if (linesOfCodeCurrentNode > 0) {
        blankLines += linesOfCodeCurrentNode - nonBlankLines;
      }
    } else {
      linesOfCode += linesOfCodeCurrentNode;
    }
  }
}
