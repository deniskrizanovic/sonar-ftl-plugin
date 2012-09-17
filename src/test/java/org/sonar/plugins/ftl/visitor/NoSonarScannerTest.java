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

import org.junit.Test;
import org.sonar.api.checks.NoSonarFilter;
import org.sonar.api.resources.Directory;
import org.sonar.api.resources.File;
import org.sonar.api.resources.Resource;
import org.sonar.api.rules.Rule;
import org.sonar.api.rules.Violation;
import org.sonar.plugins.ftl.lex.PageLexer;
import org.sonar.plugins.ftl.node.Node;

import java.io.StringReader;
import java.util.List;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

/**
 * @author Matthijs Galesloot
 */
public class NoSonarScannerTest {

  @Test
  public void scanNoSonar() {
    String fragment = "<table>\n<!-- //NOSONAR --><td>\n</table>";

    StringReader reader = new StringReader(fragment);
    PageLexer lexer = new PageLexer();
    List<Node> nodeList = lexer.parse(reader);
    Resource<Directory> resource = new File("test");
    FtlSourceCode ftlSourceCode = new FtlSourceCode(resource);

    NoSonarFilter noSonarFilter = new NoSonarFilter();
    NoSonarScanner noSonarScanner = new NoSonarScanner(noSonarFilter);
    PageScanner pageScanner = new PageScanner();
    pageScanner.addVisitor(noSonarScanner);
    pageScanner.scan(nodeList, ftlSourceCode);

    Rule rule = Rule.create("Ftl", "test", "test");
    Violation violation = Violation.create(rule, resource);

    violation.setLineId(1);
    assertFalse(noSonarFilter.isIgnored(violation));
    violation.setLineId(2);
    assertTrue(noSonarFilter.isIgnored(violation));
    violation.setLineId(3);
    assertFalse(noSonarFilter.isIgnored(violation));
  }
}
